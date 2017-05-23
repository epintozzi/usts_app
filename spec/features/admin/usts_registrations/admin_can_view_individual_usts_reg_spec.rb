require "rails_helper"

describe "/admin/usts_registrations/:id" do

  scenario "admin can view individual usts registration" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    usts_reg = create(:usts_registration)

    visit admin_usts_registrations_path

    click_on "View"

    expect(page).to have_content(usts_reg.first_name)
    expect(page).to have_content(usts_reg.last_name)
    expect(current_path).to eq(admin_usts_registration_path(usts_reg))
  end

  scenario "editor cannot view individual usts registration" do
    editor = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(editor)

    create(:usts_registration)

    visit admin_usts_registrations_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "editor cannot view individual usts registration" do
    user = create(:user, role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    create(:usts_registration)

    visit admin_usts_registrations_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "non-logged in user cannot view individual usts registration" do
    create(:usts_registration)

    visit admin_usts_registrations_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

end
