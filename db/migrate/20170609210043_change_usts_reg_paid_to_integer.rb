class ChangeUstsRegPaidToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column_default :usts_registrations, :paid, nil
    change_column :usts_registrations, :paid, :integer, :using => 'case when paid then 2 else 0 end', default: 0
  end
end
