class Seengame < ActiveRecord::Base
	belongs_to :court
	belongs_to :user

	validates :games, presence: true

end
