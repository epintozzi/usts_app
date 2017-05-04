class Admin::RaceRegistrationsController < Admin::BaseController

  def index
    @race_registrations = RaceRegistration.all
  end

  def show
  end

end
