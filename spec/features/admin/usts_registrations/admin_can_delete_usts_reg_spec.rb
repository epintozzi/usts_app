require "rails_helper"

describe "/admin/usts_registrations/:id" do
  scenario "admin can delete a usts registration" do
    admin = create(:user, role: 2)
    race = create(:race, start_date: Date.today)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    usts_reg = create(:usts_registration)

    visit admin_usts_registrations_path

    click_on "Delete"

    expect(page).to have_content("This USTS Member registration has been deleted.")
    expect(current_path).to eq(admin_usts_registrations_path)
  end
  scenario "editor cannot delete a usts registration" do
    editor = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(editor)

    usts_reg = create(:usts_registration)

    visit admin_usts_registrations_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
  scenario "normal user cannot delete a usts registration" do
    user = create(:user, role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    usts_reg = create(:usts_registration)

    visit admin_usts_registrations_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
  scenario "non-logged in user cannot delete a usts registration" do
    usts_reg = create(:usts_registration)

    visit admin_usts_registrations_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

end
