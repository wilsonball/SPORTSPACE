class CreateSeengames < ActiveRecord::Migration
  def change
    create_table :seengames do |t|
      t.integer :games

      t.timestamps null: false
    end
  end
end
