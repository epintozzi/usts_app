require "rails_helper"

describe "/admin/dashboard" do

  scenario "admin can see dashboard" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    expect(page).to have_content("Manage Races")
    expect(page).to have_content("Manage Galleries")
    expect(page).to have_content("Manage News")
    expect(page).to have_content("Manage Race Registrations")
    expect(page).to have_content("Manage USTS Membership Registrations")
    expect(page).to have_content("Manage User Accounts")
  end

  scenario "editor cannot see dashboard" do
    editor = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(editor)

    visit admin_dashboard_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "normal user cannot see dashboard" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_dashboard_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "non-logged in user cannot see dashboard" do
    visit admin_dashboard_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
