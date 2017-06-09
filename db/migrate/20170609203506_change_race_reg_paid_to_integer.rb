class ChangeRaceRegPaidToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column_default :race_registrations, :paid, nil
    change_column :race_registrations, :paid, :integer, :using => 'case when paid then 2 else 0 end', default: 0
  end
end
