require "rails_helper"

describe "/admin/race_registrations/:id" do
  scenario "admin can delete a race registration" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    race_reg = create(:race_registration)

    visit admin_race_registrations_path

    click_on "Delete"

    expect(page).to have_content("This race registration has been deleted.")
    expect(current_path).to eq(admin_race_registrations_path)
  end
  scenario "editor cannot delete a race registration" do
    editor = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(editor)

    race_reg = create(:race_registration)

    visit admin_race_registrations_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
  scenario "normal user cannot delete a race registration" do
    user = create(:user, role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    race_reg = create(:race_registration)

    visit admin_race_registrations_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
  scenario "non-logged in user cannot delete a race registration" do
    race_reg = create(:race_registration)

    visit admin_race_registrations_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

end
