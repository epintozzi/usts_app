class Admin::UstsRegistrationsController < Admin::BaseController

  def index
    @usts_registrations = UstsRegistration.all
  end

  def show
    @usts_registration = UstsRegistration.find(params[:id])
  end

  def edit
    @usts_registration = UstsRegistration.find(params[:id])
  end

  def update
    @usts_registration = UstsRegistration.find(params[:id])
    if @usts_registration.update(usts_registration_params)
      flash[:success] = "This USTS Member registration has successfully been updated."
      redirect_to admin_usts_registrations_path
    else
      flash[:danger] = "Something went wrong. #{@usts_registration.errors.full_messages.join(' ')}. Please try again."
      render :edit
    end
  end

  def destroy
    @usts_registration = UstsRegistration.find(params[:id])
    @usts_registration.destroy
    flash[:success] = "This USTS Member registration has been deleted."
    redirect_to admin_usts_registrations_path
  end

  private

  def usts_registration_params
    params.require(:usts_registration).permit(:id, :race_year, :first_name, :last_name, :usts_number, :street_address, :city, :state, :zip, :email, :phone, :fax, :signature, :birthdate, :liability_release, :membership_type, :creator_id)
  end

end
