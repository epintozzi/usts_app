class RemoveImageFromSponsors < ActiveRecord::Migration[5.0]
  def change
    remove_column :sponsors, :image, :text
  end
end
