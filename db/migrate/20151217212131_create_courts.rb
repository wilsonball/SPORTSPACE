class CreateCourts < ActiveRecord::Migration
  def change
    create_table :courts do |t|
      t.string :court_type
      t.string :court_floor
      t.integer :court_count
      t.string :listing_name
      t.string :address
      t.text :summary
      t.boolean :is_3pt
      t.boolean :is_ncaa3pt
      t.boolean :is_nba3pt
      t.boolean :is_centercircle
      t.boolean :is_key
      t.boolean :is_freethrowline
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
