class Run < ActiveRecord::Base
  belongs_to :user
  belongs_to :court

  validates :start_time, presence: true
  validates :end_time, presence: true

  acts_as_votable
end
