class Review < ActiveRecord::Base
  belongs_to :court
  belongs_to :user
end
