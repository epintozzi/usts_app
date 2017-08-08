class Admin::RaceResultsController < Admin::BaseController

  def index
    @boat_classes = BoatClass.all.order(id: :asc)
    @races = Race.all.order(start_date: :asc)
  end

  def new
    @race_result = RaceResult.new
  end

  def create
    @race_result = RaceResult.new(race_result_params)
    if @race_result.save
      flash[:success] = "This race result has successfully been created."
      redirect_to admin_race_results_path
    else
      flash[:danger] = "Something went wrong. #{@race_result.errors.full_messages.join(' ')}. Please try again."
      render :new
    end
  end

  def edit
    @race_result = RaceResult.find(params[:id])
  end

  def update
    @race_result = RaceResult.find(params[:id])
    if @race_result.update(race_result_params)
      flash[:success] = "You have successfully updated this race result"
      redirect_to admin_race_results_path
    else
      flash[:danger] = "Something went wrong. #{@race_result.errors.full_messages.join(' ')}. Please try again."
      render :edit
    end
  end

  def destroy
    @race_result = RaceResult.find(params[:id])
    @race_result.destroy
    flash[:success] = "This race result has been deleted."
    redirect_to admin_race_results_path
  end

  def import
    RaceResult.import(params[:file])
    redirect_to admin_race_results_path, notice: "Results imported"
  end

  private

  def race_result_params
    params.require(:race_result).permit(:id, :race_id, :boat_class_id, :driver_name, :points)
  end

end
