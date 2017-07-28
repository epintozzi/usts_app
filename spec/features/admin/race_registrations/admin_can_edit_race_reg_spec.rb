require "rails_helper"

describe "/admin/race_registrations/:id" do

  scenario "admin can access edit race registration form" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    race_reg = create(:race_registration)

    visit admin_race_registrations_path
    click_on "Edit"

    expect(current_path).to eq(edit_admin_race_registration_path(race_reg))
    expect(page).to have_content(race_reg.race.city)
    expect(page).to have_content(race_reg.boat_class.class_name)
    expect(page).to have_content(race_reg.usts_registration.first_name)
    expect(page).to have_content(race_reg.usts_registration.last_name)
  end

  scenario "admin can edit race registration" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    race_reg = create(:race_registration)

    visit edit_admin_race_registration_path(race_reg)

    fill_in "race_registration[boat_number]", with: "new number"

    click_on "Update Race Registration"

    expect(page).to have_content("This race registration has successfully been updated.")
    expect(current_path).to eq(admin_race_registrations_path)
  end

  scenario "admin sees error when editing race registration and removes required fields" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    race_reg = create(:race_registration)

    visit edit_admin_race_registration_path(race_reg)

    fill_in "race_registration[boat_number]", with: ""

    click_on "Update Race Registration"

    expect(page).to have_content("Something went wrong. Boat number can't be blank. Please try again.")
  end

  scenario "editor cannot access edit race registration form" do
    editor = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(editor)

    create(:race_registration)

    visit admin_race_registrations_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "normal user cannot access edit race registration form" do
    user = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    create(:race_registration)

    visit admin_race_registrations_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "non-logged in user cannot access edit race registration form" do
    create(:race_registration)

    visit admin_race_registrations_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

end
