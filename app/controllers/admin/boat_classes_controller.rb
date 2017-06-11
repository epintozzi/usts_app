class Admin::BoatClassesController < Admin::BaseController

  def index
    @boat_classes = BoatClass.all
  end

  def new
    @boat_class = BoatClass.new()
  end

  def create
    @boat_class = BoatClass.new(boat_class_params)
    if @boat_class.save
      flash[:success] = "This boat class has successfully been created."
      redirect_to admin_boat_classes_path
    else
      flash[:danger] = "Something went wrong. #{@boat_class.errors.full_messages.join(' ')}. Please try again."
      render :new
    end
  end

  def edit
    @boat_class = BoatClass.find(params[:id])
  end

  def update
    @boat_class = BoatClass.find(params[:id])
    if @boat_class.update(boat_class_params)
      flash[:success] = "This boat class has successfully been updated."
      redirect_to admin_boat_classes_path
    else
      flash[:danger] = "Something went wrong. #{@boat_class.errors.full_messages.join(' ')}. Please try again."
      render :edit
    end
  end

  def destroy
    @boat_class = BoatClass.find(params[:id])
    @boat_class.destroy
    flash[:success] = "This boat_class has been deleted."
    redirect_to admin_boat_classes_path
  end

  private

  def boat_class_params
    params.require(:boat_class).permit(:id, :class_name, :registration_fee)
  end


end
