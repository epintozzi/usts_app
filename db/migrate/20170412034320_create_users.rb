class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.text :first_name
      t.text :last_name
      t.text :email
      t.string :password_digest
      t.boolean :driver?, default: false
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
