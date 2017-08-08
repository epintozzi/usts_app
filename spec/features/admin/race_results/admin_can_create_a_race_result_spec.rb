require "rails_helper"

describe "/admin/race_results/new" do
  scenario "admin can create individual race result" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    race = create(:race, city: "Atlanta")
    boat_class_1, boat_class_2 = create_list(:boat_class, 2)

    visit new_admin_race_result_path

    fill_in "race_result[driver_name]", with: "Ryan"
    select boat_class_2.class_name
    select race.city
    fill_in "race_result[points]", with: 10
    click_on "Create Race result"

    expect(current_path).to eq(admin_race_results_path)
    expect(page).to have_content("This race result has successfully been created.")
    expect(page).to have_content("Ryan")
  end

  scenario "admin can't add duplicate individual race result" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    race = create(:race)
    boat_class_1, boat_class_2 = create_list(:boat_class, 2)
    create(:race_result, driver_name: "Erin", race_id: race.id, boat_class_id: boat_class_1.id)

    visit new_admin_race_result_path

    fill_in "race_result[driver_name]", with: "Erin"
    select boat_class_1.class_name
    select race.city
    fill_in "race_result[points]", with: 10
    click_on "Create Race result"

    expect(page).to have_content("Boat class has already been recorded for this driver and race location. Please try again.")
  end

  scenario "editor cannot add a race result" do
    editor = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(editor)

    create(:race_result)

    visit new_admin_race_result_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "normal user cannot add a race result" do
    user = create(:user, role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    create(:race_result)

    visit new_admin_race_result_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "non-logged in user cannot add a race result" do
    create(:race_result)

    visit new_admin_race_result_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
