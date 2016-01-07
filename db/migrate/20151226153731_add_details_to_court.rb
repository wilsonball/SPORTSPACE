class AddDetailsToCourt < ActiveRecord::Migration
  def change
    add_column :courts, :rim_type, :string
    add_column :courts, :rim_height, :string
    add_column :courts, :backboard, :string
  end
end
