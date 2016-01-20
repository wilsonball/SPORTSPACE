class RemoveAddressFromCourts < ActiveRecord::Migration
  def change
    remove_column :courts, :address, :string
  end
end
