require "rails_helper"

describe "/admin/race_results/:id" do
  xscenario "admin can delete a race result" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    race_result = create(:race_result, driver_name: "Erin")

    visit admin_race_results_path
    expect(page).to have_content(race_result.driver_name)

    find(:css, ".glyphicon.glyphicon-remove").click

    expect(page).to have_content("This race result has been deleted.")
    expect(current_path).to eq(admin_race_results_path)
    expect(page).to_not have_content(race_result.driver_name)
  end
  scenario "editor cannot delete a race result" do
    editor = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(editor)

    create(:race_result)

    visit admin_race_results_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
  scenario "normal user cannot delete a race result" do
    user = create(:user, role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    create(:race_result)

    visit admin_race_results_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
  scenario "non-logged in user cannot delete a race result" do
    create(:race_result)

    visit admin_race_results_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

end
