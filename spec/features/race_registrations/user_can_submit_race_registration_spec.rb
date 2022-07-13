require "rails_helper"

describe "race_registrations/new" do
  before :each do
    @boat_class = create(:boat_class, class_name: "125cc Runabout")
    @race = create(:race, title: "Race for the Kids", city: "Lake Alfred")
    @usts_reg = create(:usts_registration, :paid, first_name: "Erin", last_name: "Pintozzi")
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_race_registration_path
  end

  scenario "user can submit a race registration" do

    select "Erin Pintozzi"
    select "Lake Alfred"
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

  scenario "user sees an error if they create a race reg without a registrant selected" do

    select "Lake Alfred"
    select "125cc Runabout"
    fill_in "race_registration[boat_number]", with: "V26"
    fill_in "race_registration[boat_name]", with: "Ronda"
    fill_in "race_registration[boat_owner]", with: "Bill Kurps"
    fill_in "race_registration[boat_owner_zip]", with: "60402"
    fill_in "race_registration[emergency_contact]", with: "Brad Barth"
    fill_in "race_registration[emergency_phone]", with: "9876544321"
    check "race_registration[emergency_contact_at_race]"
    click_on "Submit Race Registration"

    expect(page).to have_content("Something went wrong. Usts registration must exist. Usts registration can't be blank. Please try your registration again.")
  end

  scenario "user sees an error if they create a race reg without a race selected" do

    select "Erin Pintozzi"
    select "125cc Runabout"
    fill_in "race_registration[boat_number]", with: "V26"
    fill_in "race_registration[boat_name]", with: "Ronda"
    fill_in "race_registration[boat_owner]", with: "Bill Kurps"
    fill_in "race_registration[boat_owner_zip]", with: "60402"
    fill_in "race_registration[emergency_contact]", with: "Brad Barth"
    fill_in "race_registration[emergency_phone]", with: "9876544321"
    check "race_registration[emergency_contact_at_race]"
    click_on "Submit Race Registration"

    expect(page).to have_content("Something went wrong. Race must exist. Race can't be blank. Please try your registration again.")
  end

  scenario "user sees an error if they create a race reg without a boat class selected" do

    select "Erin Pintozzi"
    select "Lake Alfred"
    fill_in "race_registration[boat_number]", with: "V26"
    fill_in "race_registration[boat_name]", with: "Ronda"
    fill_in "race_registration[boat_owner]", with: "Bill Kurps"
    fill_in "race_registration[boat_owner_zip]", with: "60402"
    fill_in "race_registration[emergency_contact]", with: "Brad Barth"
    fill_in "race_registration[emergency_phone]", with: "9876544321"
    check "race_registration[emergency_contact_at_race]"
    click_on "Submit Race Registration"

    expect(page).to have_content("Something went wrong. Boat class must exist. Boat class can't be blank. Please try your registration again.")
  end

  scenario "user sees an error if they create a race reg without a boat number" do

    select "Erin Pintozzi"
    select "Lake Alfred"
    select "125cc Runabout"
    fill_in "race_registration[boat_name]", with: "Ronda"
    fill_in "race_registration[boat_owner]", with: "Bill Kurps"
    fill_in "race_registration[boat_owner_zip]", with: "60402"
    fill_in "race_registration[emergency_contact]", with: "Brad Barth"
    fill_in "race_registration[emergency_phone]", with: "9876544321"
    check "race_registration[emergency_contact_at_race]"
    click_on "Submit Race Registration"

    expect(page).to have_content("Something went wrong. Boat number can't be blank. Please try your registration again.")
  end

  scenario "user sees an error if they try to register for same race location and class" do

    create(:race_registration, usts_registration: @usts_reg, boat_class: @boat_class, race: @race)

    select "Erin Pintozzi"
    select "Lake Alfred"
    select "125cc Runabout"
    fill_in "race_registration[boat_number]", with: "V26"
    fill_in "race_registration[boat_name]", with: "Ronda"
    fill_in "race_registration[boat_owner]", with: "Bill Kurps"
    fill_in "race_registration[boat_owner_zip]", with: "60402"
    fill_in "race_registration[emergency_contact]", with: "Brad Barth"
    fill_in "race_registration[emergency_phone]", with: "9876544321"
    check "race_registration[emergency_contact_at_race]"
    click_on "Submit Race Registration"

    expect(page).to have_content("Something went wrong. Boat class has already been registered for this driver and race location. Please try your registration again.")
  end
end
