class CreateSeenplayers < ActiveRecord::Migration
  def change
    create_table :seenplayers do |t|
      t.integer :players

      t.timestamps null: false
    end
  end
end
