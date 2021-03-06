class Userphoto < ActiveRecord::Base
  belongs_to :user
  before_save :set_name

  has_attached_file :image, 
  styles: { 
  	medium: "300x300>", 
  	thumb: "100x100>", 
  	listing: "100x100#" 
  }

    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    
end
