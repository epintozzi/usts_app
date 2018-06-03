class RaceResult < ApplicationRecord
  belongs_to :boat_class
  belongs_to :race

  before_save :proper_caps_driver_name

  validates :boat_class, presence: true
  validates :race, presence: true
  validates :points, presence: true
  validates :driver_name, presence: true
  validates :usts_number, presence: true
  validates :boat_class, uniqueness: { scope: [:usts_number, :race], message: "has already been recorded for this USTS number and race location" }

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      result_hash = row.to_hash
      RaceResult.update_or_create_by(result_hash)
    end
  end

  def proper_caps_driver_name
    self.driver_name = self.driver_name.titlecase
  end

  def self.update_or_create_by(attributes)
    points = attributes.delete('points').to_f
    driver = attributes.delete('driver_name').titlecase
    find_or_create_by(attributes).update(points: points, driver_name: driver)
  end


end
