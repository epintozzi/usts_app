class ChangeLiabilityOnUstsRegistration < ActiveRecord::Migration[5.0]
  def change
    rename_column :usts_registrations, :liability_release?, :liability_release
    rename_column :users, :driver?, :driver
  end
end
