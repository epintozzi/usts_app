class AddDeletedAtToBoatClass < ActiveRecord::Migration[5.0]
  def change
    add_column :boat_classes, :deleted_at, :datetime
    add_index :boat_classes, :deleted_at
  end
end
