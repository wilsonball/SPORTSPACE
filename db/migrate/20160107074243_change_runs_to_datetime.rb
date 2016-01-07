class ChangeRunsToDatetime < ActiveRecord::Migration
  def change
    add_column :runs, :start, :datetime, {:required => true}
    add_column :runs, :end, :datetime, {:required => true}
    remove_column :runs, :start_time, :time
    remove_column :runs, :end_time, :time
    remove_column :runs, :avail_date, :date
  end
end
