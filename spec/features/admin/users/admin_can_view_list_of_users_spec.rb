require "rails_helper"

describe "/admin/users" do

  scenario "admin sees list of all users" do
    admin = create(:user, role: 2)
    user_1, user_2 = create_list(:user, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path
    click_on "Manage User Accounts"

    expect(current_path).to eq(admin_users_path)
    expect(page).to have_content("Manage Users")
    expect(page).to have_link("Add new user")
    expect(page).to have_link("Edit")
    expect(page).to have_content(user_1.first_name)
    expect(page).to have_content(user_2.first_name)
  end

  scenario "editor does not see list of all users" do
    editor = create(:user, role: 1)
    create_list(:user, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(editor)

    visit admin_users_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "normal user does not see list of all users" do
    user = create(:user, role: 0)
    create_list(:user, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_users_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "non-logged in user does not see list of all users" do
    user = create(:user, role: 0)
    create_list(:user, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_users_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

end
