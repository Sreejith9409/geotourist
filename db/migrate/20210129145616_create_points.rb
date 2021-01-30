class CreatePoints < ActiveRecord::Migration[6.0]
  def change
    create_table :points do |t|
      t.string :name
      t.text :description
      t.integer :tour_id
      t.integer :user_id
      t.string :latitude
      t.string :longitude
      t.timestamps
    end
  end
end
