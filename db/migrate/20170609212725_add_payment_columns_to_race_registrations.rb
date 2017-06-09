class AddPaymentColumnsToRaceRegistrations < ActiveRecord::Migration[5.0]
  def change
    add_column :race_registrations, :transaction_number, :text
    add_column :race_registrations, :payment_date, :datetime
  end
end
