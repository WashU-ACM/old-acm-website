module AcmProjectsHelper
	def showcase_image_url(project)
		if project.image_url.nil?
			return "project-placeholder.png"
		else
			return project.image_url
		end
	end
end
