class CreateRaceResults < ActiveRecord::Migration[5.0]
  def change
    create_table :race_results do |t|
      t.text :driver_name
      t.float :points
      t.references :boat_class, foreign_key: true
      t.references :race, foreign_key: true

      t.timestamps
    end
  end
end
