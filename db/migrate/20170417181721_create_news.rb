class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.string :title
      t.text :content
      t.string :image
      t.references :author, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
