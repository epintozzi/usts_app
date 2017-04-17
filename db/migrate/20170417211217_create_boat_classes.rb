class CreateBoatClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :boat_classes do |t|
      t.string :class_name
      t.float :registration_fee

      t.timestamps
    end
  end
end
