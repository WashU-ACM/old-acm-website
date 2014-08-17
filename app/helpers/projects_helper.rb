require 'sanitize'
module ProjectsHelper
	def sanitize(text)
		Sanitize.clean(text, Sanitize::Config::RELAXED)
	end
	def markdown(text)
		Redcarpet.new(sanitize(text)).to_html.html_safe
	end
	def project_image_url(project)
		if project.image_url.nil?
			return "project-placeholder.png"
		else
			return project.image_url
		end
	end
end
