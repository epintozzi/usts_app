class RaceRegistrationsController < ApplicationController

  def index
    # @all_registrations = RaceRegistration.all
    @all_registrations = RaceRegistration.group(:race).count
  end

  def show
    @user_registrations = RaceRegistration.all.where(usts_registration_id: current_user.id) #how does it know it's me?? the reg_id isn't a person???
  end

  def new
    @race_reg = RaceRegistration.new()
  end

  def create
    @race_reg = RaceRegistration.new(race_registration_params)
    if @race_reg.save
      flash[:success] = "You have successfully registered for this race."
      redirect_to new_race_registration_path
    else
      flash[:alert] = "Something went wrong. Please try your registration again."
      render :new
    end
  end

  private

  def race_registration_params
    params.require(:race_registration).permit(:id, :race_id, :boat_class_id, :usts_registration_id, :boat_number, :boat_name, :boat_owner, :boat_owner_zip, :emergency_phone, :emergency_contact, :emergency_contact_at_race, :paid)
  end

end
