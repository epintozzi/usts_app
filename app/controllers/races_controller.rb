class RacesController < ApplicationController
  load_and_authorize_resource only: [:new, :create, :edit, :update]

  def index
    @races = Race.all
  end

  def show
    @race = Race.find(params[:id])
    @races = Race.future.all.limit(3)
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
