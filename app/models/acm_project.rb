class AcmProject < ActiveRecord::Base
	belongs_to :owner, class_name: "User"
	validates_presence_of :owner

	# Uploader functionality courtesy of carrierwave
	mount_uploader :image, ImageUploader

	validates_presence_of :name
	validates_presence_of :description
	
	after_initialize :init
	
	# simulated ENUM field in AcmProjects table
	validates_inclusion_of :status, :in => ["approved", "pending"]
	validates_presence_of :status
	def status
		read_attribute(:status)
	end
	def status= (value)
		write_attribute(:status, value)
	end

	def self.where_approved
		return self.where({ status: "approved" })
	end

	def self.where_pending
		return self.where({ status: "pending" })
	end

	private
	def init
		if self.status == "" || !self.status
			self.status = "pending"
		end
	end

end
