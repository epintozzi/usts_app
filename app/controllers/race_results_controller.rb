class RaceResultsController < ApplicationController

  def index
    @boat_classes = BoatClass.all
    @races = Race.races_this_year.order(start_date: :asc)
  end

end
