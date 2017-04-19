require "rails_helper"

describe "usts_registration/new" do
  scenario "user can submit member registration form" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_usts_registration_path

    within ('#usts_registration_race_year') do
      select 2017
    end
    fill_in "usts_registration[first_name]", with: "Erin"
    fill_in "usts_registration[last_name]", with: "Pintozzi"
    fill_in "usts_registration[usts_number]", with: "12345"
    select "nonracing"
    fill_in "usts_registration[street_address]", with: "123 Main St"
    fill_in "usts_registration[city]", with: "Denver"
    select "Colorado"
    fill_in "usts_registration[zip]", with: "80216"
    fill_in "usts_registration[email]", with: "erin@email.com"
    fill_in "usts_registration[phone]", with: "123-456-7890"
    fill_in "usts_registration[fax]", with: "987-654-4321"
    fill_in "usts_registration[signature]", with: "Erin Pintozzi"
    select "1987"
    select "September"
    select "26"
    check "usts_registration[liability_release]"

    click_on "Submit Membership Registration"

    expect(page).to have_content("You have successfully sumbitted your registration.")
    expect(current_path).to eq(new_usts_registration_path)
  end
end
