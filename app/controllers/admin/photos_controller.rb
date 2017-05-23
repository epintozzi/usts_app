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
      flash[:success] = "This photo has successfully been added to #{@photo.gallery.name}. #{view_context.link_to("Add another photo", new_admin_photo_path(@photo), class: 'small-link')}"
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

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:success] = "This photo has been deleted."
    redirect_to edit_admin_gallery_path(@photo.gallery)
  end

  private

  def photo_params
    params.require(:photo).permit(:id, :photographer, :caption, :image, :gallery_id)
  end


end
