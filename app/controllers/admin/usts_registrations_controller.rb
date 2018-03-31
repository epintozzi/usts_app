class Admin::UstsRegistrationsController < Admin::BaseController

  def index
    @usts_registrations = UstsRegistration.all

    respond_to do |format|
      format.html
      format.csv { send_data @usts_registrations.to_csv, filename: "usts-registrations-#{Date.today}.csv" }
    end
  end

  def membership_archives_index
    @usts_registrations = UstsRegistration.past_usts_registrations
  end

  def import
    UstsRegistration.import(params[:file])
    redirect_to admin_usts_registrations_path, notice: "Registrations imported"
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
    if @usts_registration.destroy
      flash[:success] = "This USTS Member registration has been deleted."
      redirect_to admin_usts_registrations_path
    else
      flash[:danger] = "#{@usts_registration.errors.full_messages.join(' ')}."
      redirect_to admin_usts_registrations_path
    end
  end

  private

  def usts_registration_params
    params.require(:usts_registration).permit(:id, :race_year, :first_name, :last_name, :usts_number, :street_address, :city, :state, :zip, :email, :phone, :fax, :signature, :birthdate, :liability_release, :membership_type, :creator_id, :paid)
  end

end
