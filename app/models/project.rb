class Project < ActiveRecord::Base

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to :owner, class_name: "User"
  validates_presence_of :owner
  
  has_and_belongs_to_many :enthusiasts, class_name: "User"
  after_initialize :init
  mount_uploader :image, ImageUploader

  validates_presence_of :name

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

  def slug_candidates
    [
      :name,
      [:name, :created_at_year_month],
      [:name, :tag_list],
      [:name, :created_at_year_month, :tag_list]
    ]
  end
  def created_at_year_month
    self.created_at.strftime("%b %Y")
  end
	
end
