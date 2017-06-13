class RaceResultsController < ApplicationController

  def index
    @boat_classes = BoatClass.all.order(id: :asc)
    @races = Race.races_this_year.order(start_date: :asc)
    @data = {}
    # build a big ugly hash
    @boat_classes.each do |boat_class|
      boat_class.race_results.where(race: @races).each do |result|
        @data[boat_class.id] ||= {}
        @data[boat_class.id][result.driver_name] ||= {}
        @data[boat_class.id][result.driver_name][result.race_id] = result.points
      end
    end
    @data.each do |boat_class_id, driver_hash|
      driver_hash.each do |driver_name, race_hash|
        driver_hash[driver_name][:total] = race_hash.values.reduce(:+)
      end
    end
  end

end
