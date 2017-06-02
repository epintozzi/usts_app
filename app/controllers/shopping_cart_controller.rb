class ShoppingCartController < ApplicationController

  def show
    @unpaid_race_registrations = RaceRegistration.unpaid_race_reg(current_user)
  end


end
