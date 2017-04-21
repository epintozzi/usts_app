module RaceRegistrationHelper

  def current_user_or_blank
    current_user.id if current_user
  end

end
