class ChangeEmailOnUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :email, :string, :default => "", :null => false
  end
end
