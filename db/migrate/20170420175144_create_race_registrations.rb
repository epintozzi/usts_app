class CreateRaceRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :race_registrations do |t|
      t.boolean :paid
      t.text :boat_number
      t.text :boat_owner
      t.text :boat_owner_zip
      t.text :boat_name
      t.text :emergency_contact
      t.text :emergency_phone
      t.boolean :emergency_contact_at_race
      t.references :race, foreign_key: true
      t.references :boat_class, foreign_key: true
      t.references :usts_registration, foreign_key: true
    end
  end
end
