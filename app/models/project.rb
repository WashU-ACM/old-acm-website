class Project < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  has_and_belongs_to_many :enthusiasts, class_name: "User"
  has_and_belongs_to_many :technologies
  after_initialize :init
  mount_uploader :image, ImageUploader

  belongs_to :category
  validates_presence_of :category

  def self.where_active
    return self.where(state: "active")
  end
  
  # tagging
  acts_as_taggable
	
  # simulated ENUM field in Projects table
  validates_inclusion_of :state, :in => ["active", "inactive"]
  validates_presence_of :state
  def state
    read_attribute(:state)
  end
  def state= (value)
    write_attribute(:state, value)
  end

  private
  def init
    if self.state == "" || !self.state
      self.state = "active"
    end
  end	
	
end
