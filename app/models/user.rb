class User < ActiveRecord::Base

  

	#relationships
	has_many :icpc_entries
	has_many :projects, foreign_key: "owner_id"
	has_and_belongs_to_many :interested_projects, class_name: "Project"
	has_many :competencies
	has_many :technologies, through: :competencies
	
	

	 accepts_nested_attributes_for :competencies

  def self.from_omniauth(auth)
    uid_field = uid_field_from_provider auth[:provider]
    return nil if uid_field.nil?
    return where({ uid_field => auth["uid"] }).first || create_from_omniauth(auth)
  end
  
  def self.create_from_omniauth(auth)
    create! do |user|
      # Generic properties
      user.provider = auth["provider"]
      user.first_name = auth["info"]["first_name"]
      user.last_name = auth["info"]["last_name"]
      user.email = auth["info"]["email"]

      # Provider-specific properties
      case auth[:provider]
        when "open_id"
        user.open_id = auth["uid"]
        when "shibboleth"
        user.shib_uid = auth["uid"]
        user.shib_eppn = auth["extra"]["raw_info"]["eppn"]
        user.shib_affiliation = auth["extra"]["raw_info"]["affiliation"]
        user.shib_samaccountname = auth["extra"]["raw_info"]["sAMAccountName"]
        user.shib_credid = auth["extra"]["raw_info"]["wustlEduCredId"]
      end
    end
  end


  def self.uid_field_from_provider provider
    case provider
      when "google"
      return :open_id
      when "shibboleth"
      return :shib_uid
      else
      return nil
    end
  end

  def full_name
    return "#{self.first_name} #{self.last_name}"
  end

end
