module ApplicationHelper
	def custom_bootstrap_flash
		flash_messages = []
		flash.each do |type, messages|
			puts messages.inspect
			close_button = content_tag(:button, raw("&times;"), :class => "close", "data-dismiss" => "alert")
			css_class = boostrap_flash_class(type)
			Array(messages).each do |message|
				flash_messages << content_tag("div", close_button + message.html_safe,
			                              :class => css_class, "data-fade-in-on-load" => "yes")
			end
		end
		return flash_messages.join("\n").html_safe
	end

	private
	def boostrap_flash_class(type)
		case type
		when :notice then "fade alert alert-info"
		when :success then "fade alert alert-success"
		when :error then "fade alert alert-error"
		when :alert then "fade alert alert-error"
		end
	end
end
