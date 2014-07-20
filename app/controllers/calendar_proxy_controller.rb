require "google/api_client"
require "yaml"

class CalendarProxyController < ActionController::Base
	VALID_EVENT_MIN_TIME = 3.months.ago

	def recent
		valid_objects = valid_event_objects()
		valid_objects.reject! do |obj|
			obj[:start_time] < VALID_EVENT_MIN_TIME
		end
		valid_objects.sort_by!{|obj| obj[:start_time]}

		render json: valid_objects
	end

	def upcoming
		valid_objects = valid_event_objects()
		valid_objects.reject! do |obj|
			obj[:start_time] < 1.hour.ago
		end
		valid_objects.sort_by!{|obj| obj[:start_time]}

		render json: valid_objects[0..2]
	end

	private
	def make_client
		return unless @client.nil?

		@client = Google::APIClient.new(
			application_name: "ACM Website",
			application_version: "1.0.0"
		)

		# The API key is specified in config/application.rb
		@client.key = AcmApp::Application.config.google_api_key
		@client.authorization = nil

		@calendar_service = @client.discovered_api("calendar", "v3")
	end
	def all_events
		# Loads events from the ACM Google Calendar
		# Cache the result to reduce the number of API calls
		response = Rails.cache.read(:acm_all_events)
		if response.nil?
			make_client()
			response = @client.execute(
				api_method: @calendar_service.events.list,
				parameters: {
					"calendarId" => "su.wustl.edu_v3urbk68gh9g2g83db66su3erk@group.calendar.google.com",
					"timeMin" => VALID_EVENT_MIN_TIME.iso8601
				}
			)
			Rails.cache.write(:acm_all_events, response, expires_in: 5.minutes)
			puts "GET #{response.response.env.url}"
		end
		return response
	end
	def valid_event_objects
		valid_events = all_events.data.items.reject do |event|
			event.summary.nil? ||
				event.start.nil? ||
				event.description.nil? ||
				event.description.include?("#nolist")
		end
		valid_objects = valid_events.map do |event|
			start_time = event.start.date_time
			start_time = Time.zone.parse(event.start.date) if start_time.nil?

			end_time = event.end.date_time
			end_time = Time.zone.parse(event.end.date) if end_time.nil?

			{
				name: event.summary,
				description: event.description,
				location: event.location,
				start_time: start_time,
				end_time: end_time,
				url: event.html_link
			}
		end
		return valid_objects
	end
end
