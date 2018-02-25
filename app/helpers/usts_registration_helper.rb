module UstsRegistrationHelper

  def usts_registration_name_list
    return UstsRegistration.usts_registrations_this_year.paid.where(membership_type: [1, 2]).full_name_list
  end

end
