class Seengame < ActiveRecord::Base
	belongs_to :court
	belongs_to :user

	validates :games, presence: true

	acts_as_votable

end