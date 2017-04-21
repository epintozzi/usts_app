module UstsRegistrationHelper

  def usts_registration_name_list
    return UstsRegistration.where(membership_type: 1).full_name_list
  end

end
