class AddCreatedByToRaceRegistration < ActiveRecord::Migration[5.0]
  def change
    add_reference :race_registrations, :creator, index: true, foreign_key: { to_table: :users }
  end
end
