class Court < ActiveRecord::Base
	belongs_to :user
	has_many :photos
	has_many :runs
	has_many :reviews
	has_many :seenplayers
	has_many :seengames

	geocoded_by :address
	after_validation :geocode, if: :address_changed?

	validates :listing_name, presence: true, length: {maximum: 50}
	validates :address, presence: true

	def average_rating
		reviews.count == 0 ? 0 : reviews.average(:star).round(2)
	end

	def show_first_photo 
		if photos.length == 0
			'http://www.mckearneyasphalt.com/images/basketball-court/basketball-court-construction-2-thumb.jpg'
		else
			photos[0].image.url(:thumb)
		end
	end

	def show_first_photo_medium
		if photos.length == 0
			'http://www.mckearneyasphalt.com/images/basketball-court/basketball-court-construction-2-thumb.jpg'
		else
			photos[0].image.url(:medium)
		end
	end

end
