class Admin::RacesController < Admin::BaseController

  def index
    @races = Race.future
    @all_races = Race.all - @races
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
      flash[:danger] = "Something went wrong. #{@race.errors.full_messages.join(' ')}. Please try again."
      render :new
    end
  end

  def edit
    @race = Race.find(params[:id])
  end

  def update
    @race = Race.find(params[:id])
    if @race.update(race_params)
      flash[:success] = "This race has successfully been updated."
      redirect_to admin_races_path
    else
      flash[:danger] = "Something went wrong. #{@race.errors.full_messages.join(' ')}. Please try again."
      render :edit
    end
  end

  def destroy
    @race = Race.find(params[:id])
    if @race.destroy
      flash[:success] = "This race has been deleted."
      redirect_to admin_races_path
    else
      flash[:danger] = "#{@race.errors.full_messages.join(' ')}."
      redirect_to admin_races_path
    end
  end

  private

  def race_params
    params.require(:race).permit(:id, :street_address, :city, :state, :fee_override, :start_date, :end_date, :sanction, :details, :hotel_information, :title)
  end

end
