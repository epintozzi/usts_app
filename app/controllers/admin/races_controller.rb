class Admin::RacesController < Admin::BaseController

  def index
    @races = Race.all
  end

  def show
    @race = Race.find(params[:id])
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
