class AddPaidToUstsRegistration < ActiveRecord::Migration[5.0]
  def change
    add_column :usts_registrations, :paid, :boolean, default: false
  end
end
