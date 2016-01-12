class Suggestion < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :comment, presence: true
end
