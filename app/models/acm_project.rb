class AcmProject < ActiveRecord::Base
      belongs_to :user
      
      #Uploader functionality courtesy of carrierwave
       mount_uploader :image, ImageUploader
       
       
end
