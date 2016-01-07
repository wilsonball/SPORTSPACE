class AddPriceToCourt < ActiveRecord::Migration
  def change
    add_column :courts, :price, :integer
  end
end
