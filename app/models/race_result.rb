class RaceResult < ApplicationRecord
  belongs_to :boat_class
  belongs_to :race

  before_save :proper_caps

  validates :boat_class, presence: true
  validates :race, presence: true
  validates :points, presence: true
  validates :driver_name, presence: true
  validates :boat_class, uniqueness: { scope: [:driver_name, :race], message: "has already been recorded for this driver and race location" }

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      result_hash = row.to_hash
      RaceResult.update_or_create_by(result_hash)
    end
  end

  def proper_caps
    self.driver_name = self.driver_name.titlecase
  end

  def self.update_or_create_by(attributes)
    attributes["driver_name"] = attributes["driver_name"].titlecase
    points = attributes.delete("points").to_f
    find_or_create_by(attributes).update(points: points)
  end


end
