class AddDeletedAtToUstsRegistration < ActiveRecord::Migration[5.0]
  def change
    add_column :usts_registrations, :deleted_at, :datetime
    add_index :usts_registrations, :deleted_at
  end
end
