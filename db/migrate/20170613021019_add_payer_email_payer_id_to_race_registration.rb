class AddPayerEmailPayerIdToRaceRegistration < ActiveRecord::Migration[5.0]
  def change
    add_column :race_registrations, :payer_email, :text
    add_column :race_registrations, :payer_id, :text
  end
end
