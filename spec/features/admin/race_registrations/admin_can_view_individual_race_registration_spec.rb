require "rails_helper"

describe "/admin/race_registrations/:id" do

  scenario "admin can view individual race registration" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    race_reg = create(:race_registration)

    visit admin_race_registrations_path

    click_on "View"

    expect(page).to have_content(race_reg.race.city)
    expect(page).to have_content(race_reg.usts_registration.first_name)
    expect(page).to have_content(race_reg.usts_registration.last_name)
    expect(current_path).to eq(admin_race_registration_path(race_reg))
  end

  scenario "editor cannot view individual race registration" do
    editor = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(editor)

    create(:race_registration)

    visit admin_race_registrations_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "editor cannot view individual race registration" do
    user = create(:user, role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    create(:race_registration)

    visit admin_race_registrations_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "non-logged in user cannot view individual race registration" do
    create(:race_registration)

    visit admin_race_registrations_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

end
