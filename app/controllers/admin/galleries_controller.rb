class Admin::GalleriesController < Admin::BaseController

  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def new
    @gallery = Gallery.new()
  end

  def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      flash[:success] = "This gallery has successfully been created."
      redirect_to admin_galleries_path
    else
      flash[:danger] = "Something went wrong. #{@gallery.errors.full_messages.join(' ')}. Please try again."
      render :new
    end
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])
    if @gallery.update(gallery_params)
      flash[:success] = "This gallery has successfully been updated."
      redirect_to admin_galleries_path
    else
      flash[:danger] = "Something went wrong. #{@gallery.errors.full_messages.join(' ')}. Please try again."
      render :edit
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    flash[:success] = "This gallery and all its photos have been deleted."
    redirect_to admin_galleries_path
  end

  private

  def gallery_params
    params.require(:gallery).permit(:id, :name)
  end

end
