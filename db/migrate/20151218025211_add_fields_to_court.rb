class AddFieldsToCourt < ActiveRecord::Migration
  def change
    add_column :courts, :latitude, :float
    add_column :courts, :longitude, :float
  end
end
