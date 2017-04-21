require "rails_helper"

describe "/race_registrations" do
  scenario "user see list of all others registered for races" do
    user = create(:user)
    # race_reg_1 = create(:race_registration)
    # race_reg_2 = create(:race_registration)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit race_registrations_path

    expect(page).to have_content(race_reg_1.usts_registration.first_name)
    expect(page).to have_content(race_reg_2.usts_registration.first_name)

  end
end
