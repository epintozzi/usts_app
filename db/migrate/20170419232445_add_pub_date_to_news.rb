class AddPubDateToNews < ActiveRecord::Migration[5.0]
  def change
    add_column :news, :published_on, :datetime
  end
end
