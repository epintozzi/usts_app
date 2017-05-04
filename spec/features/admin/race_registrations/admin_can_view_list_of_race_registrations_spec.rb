require "rails_helper"

describe "/admin/race_registrations" do
  scenario "admin can view list of race registrations" do
    admin = create(:user, role: 2)
    reg_1, reg_2 = create_list(:race_registration, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    click_on "Manage Race Registrations"

    expect(current_path).to eq(admin_race_registrations_path)
    expect(page).to have_content(reg_1.usts_registration.first_name)
    expect(page).to have_content(reg_1.usts_registration.last_name)
    expect(page).to have_content(reg_1.race.city)
    expect(page).to have_content(reg_1.race.state)
    expect(page).to have_content(reg_1.boat_class.class_name)
    expect(page).to have_content(reg_2.usts_registration.first_name)
    expect(page).to have_content(reg_2.usts_registration.last_name)
    expect(page).to have_content(reg_2.race.city)
    expect(page).to have_content(reg_2.race.state)
    expect(page).to have_content(reg_2.boat_class.class_name)
  end

  scenario "admin can access list of race registrations" do
    admin = create(:user, role: 2)
    reg_1, reg_2 = create_list(:race_registration, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_race_registrations_path

    expect(current_path).to eq(admin_race_registrations_path)
    expect(page).to have_content(reg_1.usts_registration.first_name)
    expect(page).to have_content(reg_2.usts_registration.first_name)
  end

  scenario "editor cannot access list of race registrations" do
    editor = create(:user, role: 1)
    create_list(:race_registration, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(editor)

    visit admin_race_registrations_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "normal user cannot access list of race registrations" do
    user = create(:user, role: 0)
    create_list(:race_registration, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_race_registrations_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
  
  scenario "non-logged in user cannot access list of race registrations" do
    create_list(:race_registration, 2)

    visit admin_race_registrations_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

end
