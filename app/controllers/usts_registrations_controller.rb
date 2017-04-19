class UstsRegistrationsController < ApplicationController

  def new
    @usts_reg = UstsRegistration.new
  end

  def create
    @usts_reg = UstsRegistration.new(usts_registration_params)
    @usts_reg.creator = current_user
    if @usts_reg.save
      flash[:success] = "You have successfully sumbitted your registration."
      redirect_to new_usts_registration_path
    else
      flash[:alert] = "There was a problem with your submission. Please try again."
      render :new
    end
  end


  private

  def usts_registration_params
    params.require(:usts_registration).permit(:id, :race_year, :first_name, :last_name, :usts_number, :street_address, :city, :state, :zip, :email, :phone, :fax, :signature, :birthdate, :liability_release, :membership_type, :creator_id)
  end

end
