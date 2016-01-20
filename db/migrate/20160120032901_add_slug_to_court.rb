class AddSlugToCourt < ActiveRecord::Migration
  def change
    add_column :courts, :slug, :string
    add_index :courts, :slug, unique: true
  end
end
