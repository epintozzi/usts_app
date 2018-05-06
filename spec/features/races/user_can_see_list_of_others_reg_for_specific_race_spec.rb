require "rails_helper"

describe "/list_registrations" do
  scenario "user see list of all others registered for races" do
    user = create(:user)
    race_1 = create(:race)
    race_2 = create(:race)
    race_reg_1 = create(:race_registration, race_id: race_1.id)
    race_reg_2 = create(:race_registration, race_id: race_2.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit list_registrations_path(race_id: race_1.id)

    expect(page).to have_content(race_reg_1.usts_registration.first_name)
    expect(page).to_not have_content(race_reg_2.usts_registration.first_name)

  end
end
