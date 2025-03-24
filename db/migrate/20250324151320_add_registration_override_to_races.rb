class AddRegistrationOverrideToRaces < ActiveRecord::Migration[6.1]
  def change
    add_column :races, :registration_override, :boolean, default: false
  end
end
