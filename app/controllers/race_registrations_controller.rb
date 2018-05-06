class RaceRegistrationsController < ApplicationController
  load_and_authorize_resource only: [:show, :new, :create]

  def index
    @all_registrations = RaceRegistration.for_future_races.group(:race).count
  end

  # shows list of all of a users registrations and registrations a user has made
  # on behalf of another
  #
  def my_registrations
    races_this_year = RaceRegistration.for_races_this_year
    race_regs = races_this_year.where(creator_id: current_user.id)
    race_regs += races_this_year.includes(:usts_registration).where(usts_registrations: {creator_id: current_user.id})
    @race_registrations_this_year = race_regs.uniq
  end

  def new
    @race_reg = RaceRegistration.new()
  end

  def create
    @race_reg = RaceRegistration.new(race_registration_params)
    @race_reg.creator = current_user
    message = 'Click here to checkout.'
    if @race_reg.save
      flash[:success] = "You have successfully registered for this race. #{view_context.link_to(message, cart_path, html_options = {class: 'small-link'})}"
      redirect_to new_race_registration_path
    else
      flash[:danger] = "Something went wrong. #{@race_reg.errors.full_messages.join('. ')}. Please try your registration again."
      render :new
    end
  end

  private

  def race_registration_params
    params.require(:race_registration).permit(:id, :race_id, :boat_class_id, :usts_registration_id, :boat_number, :boat_name, :boat_owner, :boat_owner_zip, :emergency_phone, :emergency_contact, :emergency_contact_at_race, :paid)
  end

end
