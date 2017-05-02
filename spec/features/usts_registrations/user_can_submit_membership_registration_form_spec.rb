require "rails_helper"

describe "usts_registrations/new" do
  before :each do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_usts_registration_path
  end

  scenario "user can submit member registration form" do

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

  scenario "user sees error message if first name is missing when submitting usts registration form" do

    within ('#usts_registration_race_year') do
      select 2017
    end
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

    expect(page).to have_content("There was a problem with your submission. First name can't be blank. Please try again.")
  end

  scenario "user sees error message if last name is missing when submitting usts registration form" do

    within ('#usts_registration_race_year') do
      select 2017
    end
    fill_in "usts_registration[first_name]", with: "Erin"
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

    expect(page).to have_content("There was a problem with your submission. Last name can't be blank. Please try again.")
  end

  scenario "user sees error message if usts number is missing when submitting usts registration form" do

    within ('#usts_registration_race_year') do
      select 2017
    end
    fill_in "usts_registration[first_name]", with: "Erin"
    fill_in "usts_registration[last_name]", with: "Pintozzi"
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

    expect(page).to have_content("There was a problem with your submission. Usts number can't be blank. Please try again.")
  end

  scenario "user sees error message if membership type is not selected when submitting usts registration form" do

    within ('#usts_registration_race_year') do
      select 2017
    end
    fill_in "usts_registration[first_name]", with: "Erin"
    fill_in "usts_registration[last_name]", with: "Pintozzi"
    fill_in "usts_registration[usts_number]", with: "12345"
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

    expect(page).to have_content("There was a problem with your submission. Membership type can't be blank. Please try again.")
  end

  scenario "user sees error message if street address is missing when submitting usts registration form" do

    within ('#usts_registration_race_year') do
      select 2017
    end
    fill_in "usts_registration[first_name]", with: "Erin"
    fill_in "usts_registration[last_name]", with: "Pintozzi"
    fill_in "usts_registration[usts_number]", with: "12345"
    select "nonracing"
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

    expect(page).to have_content("There was a problem with your submission. Street address can't be blank. Please try again.")
  end

  scenario "user sees error message if city is missing when submitting usts registration form" do

    within ('#usts_registration_race_year') do
      select 2017
    end
    fill_in "usts_registration[first_name]", with: "Erin"
    fill_in "usts_registration[last_name]", with: "Pintozzi"
    fill_in "usts_registration[usts_number]", with: "12345"
    select "nonracing"
    fill_in "usts_registration[street_address]", with: "123 Main St"
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

    expect(page).to have_content("There was a problem with your submission. City can't be blank. Please try again.")
  end

  scenario "user sees error message if state is missing when submitting usts registration form" do

    within ('#usts_registration_race_year') do
      select 2017
    end
    fill_in "usts_registration[first_name]", with: "Erin"
    fill_in "usts_registration[last_name]", with: "Pintozzi"
    fill_in "usts_registration[usts_number]", with: "12345"
    select "nonracing"
    fill_in "usts_registration[street_address]", with: "123 Main St"
    fill_in "usts_registration[city]", with: "Denver"
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

    expect(page).to have_content("There was a problem with your submission. State can't be blank. Please try again.")
  end

  scenario "user sees error message if zip code is missing when submitting usts registration form" do

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
    fill_in "usts_registration[email]", with: "erin@email.com"
    fill_in "usts_registration[phone]", with: "123-456-7890"
    fill_in "usts_registration[fax]", with: "987-654-4321"
    fill_in "usts_registration[signature]", with: "Erin Pintozzi"
    select "1987"
    select "September"
    select "26"
    check "usts_registration[liability_release]"

    click_on "Submit Membership Registration"

    expect(page).to have_content("There was a problem with your submission. Zip can't be blank. Please try again.")
  end

  scenario "user sees error message if liability check mark is missing when submitting usts registration form" do

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

    click_on "Submit Membership Registration"

    expect(page).to have_content("There was a problem with your submission. Liability release can't be blank Liability release is not included in the list. Please try again.")
  end

  scenario "user sees error message if liability check mark is missing when submitting usts registration form" do

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
    select "1987"
    select "September"
    select "26"
    check "usts_registration[liability_release]"

    click_on "Submit Membership Registration"

    expect(page).to have_content("There was a problem with your submission. Signature can't be blank. Please try again.")
  end
end
