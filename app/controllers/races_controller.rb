class RacesController < ApplicationController

  def index
    @races = Race.all
  end

  def show
    @race = Race.find(params[:id])
    @races = Race.all.limit(3)
  end

end
