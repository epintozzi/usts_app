class Admin::UstsRegistrationsController < Admin::BaseController

  def index
    @usts_registrations = UstsRegistration.all
  end

  def show
  end

end
