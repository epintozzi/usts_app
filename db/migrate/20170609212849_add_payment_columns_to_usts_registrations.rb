class AddPaymentColumnsToUstsRegistrations < ActiveRecord::Migration[5.0]
  def change
    add_column :usts_registrations, :transaction_number, :text
    add_column :usts_registrations, :payment_date, :datetime
  end
end
