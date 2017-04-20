require "rails_helper"

describe "race_registrations/new" do
  scenario "user can submit a race registration" do
    create(:boat_class, class_name: "125cc Runabout")
    create(:race, title: "Race for the Kids", city: "Lake Alfred")
    create(:usts_registration, first_name: "Erin")
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_race_registration_path

    select "Lake Alfred"
    select "Erin"
    select "125cc Runabout"
    fill_in "race_registration[boat_number]", with: "V26"
    fill_in "race_registration[boat_name]", with: "Ronda"
    fill_in "race_registration[boat_owner]", with: "Bill Kurps"
    fill_in "race_registration[boat_owner_zip]", with: "60402"
    fill_in "race_registration[emergency_contact]", with: "Brad Barth"
    fill_in "race_registration[emergency_phone]", with: "9876544321"
    check "race_registration[emergency_contact_at_race]"

    click_on "Submit Race Registration"

    expect(page).to have_content("You have successfully registered for this race.")
    expect(current_path).to eq(new_race_registration_path)
  end
end
