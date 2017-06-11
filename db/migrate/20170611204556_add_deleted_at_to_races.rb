class AddDeletedAtToRaces < ActiveRecord::Migration[5.0]
  def change
    add_column :races, :deleted_at, :datetime
    add_index :races, :deleted_at
  end
end
