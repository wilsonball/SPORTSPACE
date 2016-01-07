class CreateGametimes < ActiveRecord::Migration
  def change
    create_table :gametimes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :court, index: true, foreign_key: true
      t.datetime :avail_date
      t.datetime :start_time
      t.datetime :end_date
      t.integer :price
      t.integer :total

      t.timestamps null: false
    end
  end
end
