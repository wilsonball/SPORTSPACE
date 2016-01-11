class Seenplayer < ActiveRecord::Base
	belongs_to :court
	belongs_to :user

	validates :players, presence: true

end
