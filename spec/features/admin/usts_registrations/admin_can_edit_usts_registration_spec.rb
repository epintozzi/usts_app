require "rails_helper"

describe "/admin/usts_registrations/:id" do

  scenario "admin can access edit usts registration form" do
    admin = create(:user, role: 2)
    race = create(:race, start_date: Date.today)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    usts_reg = create(:usts_registration)

    visit admin_usts_registrations_path

    click_on "Edit"

    expect(current_path).to eq(edit_admin_usts_registration_path(usts_reg))
  end

  scenario "admin can edit usts registration" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    usts_reg = create(:usts_registration)

    visit edit_admin_usts_registration_path(usts_reg)

    fill_in "usts_registration[first_name]", with: "new name"

    click_on "Update Membership Registration"

    expect(page).to have_content("This USTS Member registration has successfully been updated.")
    expect(current_path).to eq(admin_usts_registrations_path)
  end

  scenario "admin sees error when editing usts registration and removes required fields" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    usts_reg = create(:usts_registration)

    visit edit_admin_usts_registration_path(usts_reg)

    fill_in "usts_registration[first_name]", with: ""

    click_on "Update Membership Registration"

    expect(page).to have_content("Something went wrong. First name can't be blank. Please try again.")
  end

  scenario "editor cannot access edit usts registration form" do
    editor = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(editor)

    create(:usts_registration)

    visit admin_usts_registrations_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "normal user cannot access edit usts registration form" do
    user = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    create(:usts_registration)

    visit admin_usts_registrations_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "non-logged in user cannot access edit usts registration form" do
    create(:usts_registration)

    visit admin_usts_registrations_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

end
