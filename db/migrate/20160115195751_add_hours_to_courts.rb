class AddHoursToCourts < ActiveRecord::Migration
  def change
  	add_column :courts, :monopentime, :time
  	add_column :courts, :monclosetime, :time
  	add_column :courts, :tuesopentime, :time
  	add_column :courts, :tuesclosetime, :time
  	add_column :courts, :wedopentime, :time
  	add_column :courts, :wedclosetime, :time
  	add_column :courts, :thursopentime, :time
  	add_column :courts, :thursclosetime, :time
  	add_column :courts, :friopentime, :time
  	add_column :courts, :friclosetime, :time
  	add_column :courts, :satopentime, :time
  	add_column :courts, :satclosetime, :time
  	add_column :courts, :sunopentime, :time
  	add_column :courts, :sunclosetime, :time
  end
end
