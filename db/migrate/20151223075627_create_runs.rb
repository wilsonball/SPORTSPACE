class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.references :user, index: true, foreign_key: true
      t.references :court, index: true, foreign_key: true
      t.time :start_time
      t.time :end_time
      t.date :avail_date
      t.integer :price
      t.integer :total

      t.timestamps null: false
    end
  end
end
