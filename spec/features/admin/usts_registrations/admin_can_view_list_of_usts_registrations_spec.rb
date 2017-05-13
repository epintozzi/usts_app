require "rails_helper"

describe "/admin/usts_registrations" do
  scenario "admin can view list of usts registrations" do
    admin = create(:user, role: 2)
    reg_1, reg_2 = create_list(:usts_registration, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    click_on "Manage USTS Membership Registrations"

    expect(current_path).to eq(admin_usts_registrations_path)
    expect(page).to have_content(reg_1.first_name)
    expect(page).to have_content(reg_1.last_name)
    expect(page).to have_content(reg_1.membership_type)
    expect(page).to have_content(reg_1.race_year)
    expect(page).to have_content(reg_2.first_name)
    expect(page).to have_content(reg_2.last_name)
    expect(page).to have_content(reg_2.membership_type)
    expect(page).to have_content(reg_2.race_year)
  end

  scenario "admin can access list of usts registrations" do
    admin = create(:user, role: 2)
    reg_1, reg_2 = create_list(:usts_registration, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_usts_registrations_path

    expect(current_path).to eq(admin_usts_registrations_path)
    expect(page).to have_content(reg_1.first_name)
    expect(page).to have_content(reg_2.first_name)
  end

  scenario "editor cannot access list of usts registrations" do
    editor = create(:user, role: 1)
    create_list(:usts_registration, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(editor)

    visit admin_usts_registrations_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "normal user cannot access list of usts registrations" do
    user = create(:user, role: 0)
    create_list(:usts_registration, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_usts_registrations_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "non-logged in user cannot access list of usts registrations" do
    create_list(:usts_registration, 2)

    visit admin_usts_registrations_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

end
