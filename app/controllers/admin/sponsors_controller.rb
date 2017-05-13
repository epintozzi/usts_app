class Admin::SponsorsController < Admin::BaseController

  def index
    @sponsors = Sponsor.all
  end

  def show
    @sponsor = Sponsor.find(params[:id])
  end

  def new
    @sponsor = Sponsor.new()
  end

  def create
    @sponsor = Sponsor.new(sponsor_params)
    if @sponsor.save
      flash[:success] = "This sponsor has successfully been created."
      redirect_to admin_sponsors_path
    else
      flash[:danger] = "Something went wrong. #{@sponsor.errors.full_messages.join(' ')}. Please try again."
      render :new
    end
  end

  def edit
    @sponsor = Sponsor.find(params[:id])
  end

  def update
    @sponsor = Sponsor.find(params[:id])
    if @sponsor.update(sponsor_params)
      flash[:success] = "This sponsor has successfully been updated."
      redirect_to admin_sponsors_path
    else
      flash[:danger] = "Something went wrong. #{@sponsor.errors.full_messages.join(' ')}. Please try again."
      render :edit
    end
  end

  private

  def sponsor_params
    params.require(:sponsor).permit(:id, :name, :image, :url)
  end

end
