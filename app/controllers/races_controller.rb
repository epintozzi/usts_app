class RacesController < ApplicationController
  load_and_authorize_resource only: [:new, :create, :edit, :update]

  def index
    @races = Race.races_this_year.order(start_date: :asc)
  end

  def show
    @race = Race.find(params[:id])
    @races = Race.future.all.order(start_date: :asc).limit(3)
  end

  # shows list of all registrations for a specified race
  #
  def list_registrations
    @boat_classes = BoatClass.all
    @race = Race.find(params[:race_id])
  end

end
