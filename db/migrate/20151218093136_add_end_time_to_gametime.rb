class AddEndTimeToGametime < ActiveRecord::Migration
  def change
    add_column :gametimes, :end_time, :datetime
  end
end
