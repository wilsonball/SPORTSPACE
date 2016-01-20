class AddFullhalfToCourts < ActiveRecord::Migration
  def change
  	add_column :courts, :halfcourtcount, :integer
  	add_column :courts, :fullcourtcount, :integer
  end
end
