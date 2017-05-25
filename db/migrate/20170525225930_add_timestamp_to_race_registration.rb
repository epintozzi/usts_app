class AddTimestampToRaceRegistration < ActiveRecord::Migration[5.0]
  def change
    add_timestamps(:race_registrations, null: true)
  end
end
