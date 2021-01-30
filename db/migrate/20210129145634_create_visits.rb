class CreateVisits < ActiveRecord::Migration[6.0]
  def change
    create_table :visits do |t|
      t.string :name
      t.integer :point_id

      t.timestamps
    end
  end
end
