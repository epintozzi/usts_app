class Admin::PhotosController < Admin::BaseController

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new()
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:success] = "This photo has successfully been added to #{@photo.gallery.name}."
      redirect_to gallery_path(@photo.gallery)
    else
      flash[:danger] = "Something went wrong. #{@photo.errors.full_messages.join(' ')}. Please try again."
      render :new
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      flash[:success] = "This photo has successfully been updated."
      redirect_to admin_photos_path
    else
      flash[:danger] = "Something went wrong. #{@photo.errors.full_messages.join(' ')}. Please try again."
      render :edit
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:id, :photographer, :caption, :image, :gallery_id)
  end


end
