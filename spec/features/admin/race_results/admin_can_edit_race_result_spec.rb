require "rails_helper"

describe "/admin/race_results" do
  scenario "admin can edit individual race result" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    race_1 = create(:race, city: "Denver")
    race_2 = create(:race, city: "Atlanta")
    boat_class_1, boat_class_2 = create_list(:boat_class, 2)
    race_result = create(:race_result, driver_name: "Erin", race_id: race_1.id, boat_class_id: boat_class_1.id)

    visit edit_admin_race_result_path(race_result)

    fill_in "race_result[usts_number]", with: "34567"
    fill_in "race_result[driver_name]", with: "Ryan"
    select boat_class_2.class_name
    select race_2.city
    fill_in "race_result[points]", with: 10
    click_on "Update Race result"

    expect(current_path).to eq(admin_race_results_path)
    expect(page).to have_content("You have successfully updated this race result")
    expect(page).to have_content("Ryan")
    expect(page).to_not have_content("Erin")
  end

  scenario "admin can't edit individual race result and save a duplicate" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    race = create(:race)
    boat_class_1, boat_class_2 = create_list(:boat_class, 2)
    race_result_1 = create(:race_result, driver_name: "Erin", race_id: race.id, boat_class_id: boat_class_1.id)
    race_result_2 = create(:race_result, driver_name: "Erin", race_id: race.id, boat_class_id: boat_class_2.id)


    visit edit_admin_race_result_path(race_result_2)

    select boat_class_1.class_name
    click_on "Update Race result"

    expect(page).to have_content("Boat class has already been recorded for this USTS number and race location. Please try again.")
  end

  scenario "editor cannot edit a race result" do
    editor = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(editor)

    race_result = create(:race_result)

    visit edit_admin_race_result_path(race_result)

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "normal user cannot edit a race result" do
    user = create(:user, role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    race_result = create(:race_result)

    visit edit_admin_race_result_path(race_result)

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "non-logged in user cannot edit a race result" do
    race_result = create(:race_result)

    visit edit_admin_race_result_path(race_result)

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
