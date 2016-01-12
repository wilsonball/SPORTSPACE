class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.text :comment

      t.timestamps null: false
    end
  end
end
