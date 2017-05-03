module UstsRegistrationHelper

  def usts_registration_name_list
    return UstsRegistration.where(membership_type: 1, race_year: Date.current.year).full_name_list
  end

end
