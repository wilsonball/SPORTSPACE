class AddActiveToCourt < ActiveRecord::Migration
  def change
    add_column :courts, :is_active, :boolean
  end
end
