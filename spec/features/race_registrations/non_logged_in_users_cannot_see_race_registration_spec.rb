require "rails_helper"

describe "/race_registrations/new" do
  scenario "non-logged in user cannot access form" do
    visit new_race_registration_path

    expect(page).to have_content("You are not authorized to access this page")
    expect(current_path).to eq(root_path)
  end
  scenario "normal user can access form" do
    user = create(:user, role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_race_registration_path

    expect(page).to have_content("Register for a Race")
    expect(current_path).to eq(new_race_registration_path)
  end
  scenario "editor user can access form" do
    user = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_race_registration_path

    expect(page).to have_content("Register for a Race")
    expect(current_path).to eq(new_race_registration_path)
  end
  scenario "admin user can access form" do
    user = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_race_registration_path

    expect(page).to have_content("Register for a Race")
    expect(current_path).to eq(new_race_registration_path)
  end
end
