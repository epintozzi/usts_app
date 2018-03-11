class AddUstsNumberToRaceResults < ActiveRecord::Migration[5.0]
  def change
    add_column :race_results, :usts_number, :text
  end
end
