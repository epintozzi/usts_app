class Admin::RacesController < Admin::BaseController

  def index
    @races = Race.all
  end

  def show
    @race = Race.find(params[:id])
  end

  def new
    @race = Race.new()
  end

  def create
    @race = Race.new(race_params)
    if @race.save
      flash[:success] = "This race has successfully been created."
      redirect_to admin_races_path
    else
      flash[:alert] = "Something went wrong. #{@race.errors.full_messages.join(' ')}. Please try again."
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def race_params
    params.require(:race).permit(:id, :street_address, :city, :state, :fee_override, :start_date, :end_date, :sanction, :details, :hotel_information, :title)
  end

end
