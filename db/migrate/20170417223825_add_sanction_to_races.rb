class AddSanctionToRaces < ActiveRecord::Migration[5.0]
  def change
    add_column :races, :sanction, :text
    add_column :races, :details, :text
  end
end
