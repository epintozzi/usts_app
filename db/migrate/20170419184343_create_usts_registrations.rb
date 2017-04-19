class CreateUstsRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :usts_registrations do |t|
      t.integer :race_year
      t.text :first_name
      t.text :last_name
      t.text :usts_number
      t.text :street_address
      t.text :city
      t.text :state
      t.text :zip
      t.text :email
      t.text :phone
      t.text :fax
      t.datetime :birthdate
      t.boolean :liability_release?
      t.integer :membership_type
      t.text :signature
      t.references :creator, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
