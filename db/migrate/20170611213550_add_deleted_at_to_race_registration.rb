class AddDeletedAtToRaceRegistration < ActiveRecord::Migration[5.0]
  def change
    add_column :race_registrations, :deleted_at, :datetime
    add_index :race_registrations, :deleted_at
  end
end
