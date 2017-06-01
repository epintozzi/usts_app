class RaceResult < ApplicationRecord
  belongs_to :boat_class
  belongs_to :race

  validates :boat_class, presence: true
  validates :race, presence: true
  validates :points, presence: true
  validates :driver_name, presence: true
  validates :boat_class, uniqueness: { scope: [:driver_name, :race], message: "has already been recorded for this driver and race location" }

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      result_hash = row.to_hash
      RaceResult.create!(result_hash)
    end
  end


end
