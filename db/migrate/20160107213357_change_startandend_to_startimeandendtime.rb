class ChangeStartandendToStartimeandendtime < ActiveRecord::Migration
  def change
  	remove_column :runs, :start, :datetime
    remove_column :runs, :end, :datetime
    add_column :runs, :start_time, :datetime
    add_column :runs, :end_time, :datetime
  end
end
