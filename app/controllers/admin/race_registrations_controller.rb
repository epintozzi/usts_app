class Admin::RaceRegistrationsController < Admin::BaseController

  def index
    @race_registrations = RaceRegistration.all

    respond_to do |format|
      format.html
      format.csv { send_data @race_registrations.to_csv, filename: "race-registrations-#{Date.today}.csv" }
    end
  end

  def show
    @race_registration = RaceRegistration.find(params[:id])
  end

  def edit
    @race_registration = RaceRegistration.find(params[:id])
  end

  def update
    @race_registration = RaceRegistration.find(params[:id])
    if @race_registration.update(race_registration_params)
      flash[:success] = "This race registration has successfully been updated."
      redirect_to admin_race_registrations_path
    else
      flash[:danger] = "Something went wrong. #{@race_registration.errors.full_messages.join(' ')}. Please try again."
      render :edit
    end
  end

  def destroy
    @race_registration = RaceRegistration.find(params[:id])
    @race_registration.destroy
    flash[:success] = "This race registration has been deleted."
    redirect_to admin_race_registrations_path
  end

  private

  def race_registration_params
    params.require(:race_registration).permit(:id, :race_id, :boat_class_id, :usts_registration_id, :boat_number, :boat_name, :boat_owner, :boat_owner_zip, :emergency_phone, :emergency_contact, :emergency_contact_at_race, :paid)
  end

end
