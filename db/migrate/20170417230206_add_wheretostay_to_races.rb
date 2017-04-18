class AddWheretostayToRaces < ActiveRecord::Migration[5.0]
  def change
    add_column :races, :hotel_information, :text
  end
end
