class Run < ActiveRecord::Base
  belongs_to :user
  belongs_to :court

  validates :start_time, presence: true
  validates :end_time, presence: true
end
