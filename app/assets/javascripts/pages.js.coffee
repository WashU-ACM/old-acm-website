# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Obfuscate address
window.acmAddr = ->
	username = "acm"
	hostname = "wustl.edu"
	addr = username + "\u0040" + hostname;
	atag = document.createElement "a"
	atag.setAttribute "href", "mailto\u003A" + addr
	atag.appendChild document.createTextNode addr
	return atag

# Events
window.sidebarEvents = (elementId) ->
	$.get "calendar/upcoming.json", (data) ->
		source = $("#sidebar-event-template").html()
		template = Handlebars.compile(source)
		data.forEach (event) ->
			$("#"+elementId).append(template(event))

Handlebars.registerHelper "eventTime", () ->
	m = moment(this.start_time).tz("America/Chicago")
	return m.calendar()

Handlebars.registerHelper "eventDuration", () ->
	m1 = moment(this.start_time)
	m2 = moment(this.end_time)
	d = moment.duration(m2.diff(m1))
	return d.humanize()