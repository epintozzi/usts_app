require "rails_helper"

describe "admin/users/edit/:id" do
  scenario "admin can edit a user" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    user = create(:user, first_name: "Erin", image: "image.jpg")

    visit edit_admin_user_path(user)

    fill_in "user[first_name]", with: "Ryan"
    select "editor"

    click_on "Update User"

    expect(page).to have_content("This user has successfully been updated.")
    expect(page).to have_content("Ryan")
    expect(page).to_not have_content("Erin")
    expect(current_path).to eq(admin_users_path)
  end

  scenario "admin sees error if first_name is missing" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    user = create(:user, first_name: "Erin")

    visit edit_admin_user_path(user)

    fill_in "user[first_name]", with: ""

    click_on "Update User"

    expect(page).to have_content("Something went wrong. First name can't be blank. Please try again.")
  end

  scenario "admin sees error if a last_name is missing" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    user = create(:user, first_name: "Erin")

    visit edit_admin_user_path(user)

    fill_in "user[last_name]", with: ""

    click_on "Update User"

    expect(page).to have_content("Something went wrong. Last name can't be blank. Please try again.")
  end

  scenario "admin sees error if a email is missing" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    user = create(:user, first_name: "Erin")

    visit edit_admin_user_path(user)

    fill_in "user[email]", with: ""

    click_on "Update User"

    expect(page).to have_content("Something went wrong. Email can't be blank. Please try again.")
  end

  scenario "editor cannot edit a user" do
    editor = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(editor)

    user = create(:user, first_name: "Erin")

    visit edit_admin_user_path(user)

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "normal user cannot edit a user" do
    user = create(:user, role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    user = create(:user, first_name: "Erin")

    visit edit_admin_user_path(user)

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "non-logged in user cannot edit a user" do
    user = create(:user, first_name: "Erin")

    visit edit_admin_user_path(user)

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
