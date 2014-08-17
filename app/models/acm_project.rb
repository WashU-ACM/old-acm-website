class AcmProject < ActiveRecord::Base

	extend FriendlyId
	friendly_id :slug_candidates, use: :slugged

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

	def slug_candidates
		[
			:name,
			[:name, :created_at_year_month]
		]
	end
	def created_at_year_month
		self.created_at.strftime("%b %Y")
	end

end
