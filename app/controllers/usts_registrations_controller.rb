class UstsRegistrationsController < ApplicationController
  load_and_authorize_resource only: [:index, :show, :new, :create]

  def index
  end

  def show
  end

  def new
    @usts_reg = UstsRegistration.new
  end

  def create
    @usts_reg = UstsRegistration.new(usts_registration_params)
    @usts_reg.creator = current_user
    message = 'Click here to checkout.'
    if @usts_reg.save
      flash[:success] = "You have successfully submitted your registration. #{view_context.link_to(message, cart_path, html_options = {class: 'small-link'})}"
      redirect_to new_usts_registration_path
    else
      flash[:danger] = "There was a problem with your submission. #{@usts_reg.errors.full_messages.join(' ')}. Please try again."
      render :new
    end
  end


  private

  def usts_registration_params
    params.require(:usts_registration).permit(:id, :race_year, :first_name, :last_name, :usts_number, :street_address, :city, :state, :zip, :email, :phone, :fax, :signature, :birthdate, :liability_release, :membership_type, :creator_id)
  end

end
