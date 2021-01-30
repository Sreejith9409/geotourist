class CreateViews < ActiveRecord::Migration[6.0]
  def change
    create_table :views do |t|
      t.string :latitude
      t.string :longitude
      t.integer :user_id
      t.integer :tour_id
      t.integer :point_id

      t.timestamps
    end
  end
end
