class AddPayerEmailPayerIdToUstsRegistration < ActiveRecord::Migration[5.0]
  def change
    add_column :usts_registrations, :payer_email, :text
    add_column :usts_registrations, :payer_id, :text
  end
end
