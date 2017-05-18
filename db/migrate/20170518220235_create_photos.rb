class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.text :photographer
      t.text :caption
      t.references :gallery, foreign_key: true

      t.timestamps
    end
  end
end
