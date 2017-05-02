class CreateSponsors < ActiveRecord::Migration[5.0]
  def change
    create_table :sponsors do |t|
      t.text :name
      t.text :image
      t.text :url

      t.timestamps
    end
  end
end
