class Seenplayer < ActiveRecord::Base
	belongs_to :court
	belongs_to :user

	validates :players, presence: true

	acts_as_votable

end
