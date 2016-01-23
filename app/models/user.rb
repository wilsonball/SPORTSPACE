class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable
  before_save :fullname 

  validates :firstname, presence: true, length: {maximum: 50}
  validates :lastname, presence: true, length: {maximum: 50}

  has_many :courts
  has_many :runs
  has_many :reviews
  has_many :photos
  has_many :userphotos
  has_many :seengames
  has_many :seenplayers
  has_many :suggestions

  acts_as_voter

  def fullname
    fullname = "#{firstname} #{lastname}"
  end

  def self.from_omniauth(auth)
  	user = User.where(email: auth.info.email).first

  	if user
  		return user
  	else
  		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  			user.firstname = auth.info.first_name
        user.lastname = auth.info.last_name
  			user.provider = auth.provider
  			user.uid = auth.uid
  			user.email = auth.info.email
  			user.image = auth.info.image
  			user.password = Devise.friendly_token[0,20]
  		end
  	end
  end
end