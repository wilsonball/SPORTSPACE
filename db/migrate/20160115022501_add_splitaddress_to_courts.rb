class AddSplitaddressToCourts < ActiveRecord::Migration
  def change
  	add_column :courts, :streetaddress, :string
  	add_column :courts, :city, :string
  	add_column :courts, :state, :string
  	add_column :courts, :zip, :string
  	add_column :courts, :country, :string
  end
end
