class Admin::RaceResultsController < Admin::BaseController

  def index
    @boat_classes = BoatClass.all
    @races = Race.all.order(start_date: :asc)
    # @results = RaceResult.all
    # @results = RaceResult.group(:boat_class).count
  end

  def import
    RaceResult.import(params[:file])
    redirect_to admin_race_results_path, notice: "Results imported"
  end

end
