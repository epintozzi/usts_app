class ChangeRaceRegistrationDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default :race_registrations, :paid, false
  end
end
