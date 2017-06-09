class RacesController < ApplicationController
  load_and_authorize_resource only: [:new, :create, :edit, :update]

  def index
    @races = Race.all.order(start_date: :asc)
  end

  def show
    @race = Race.find(params[:id])
    @races = Race.future.all.order(start_date: :asc).limit(3)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

end
