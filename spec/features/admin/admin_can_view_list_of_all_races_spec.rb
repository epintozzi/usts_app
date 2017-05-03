require "rails_helper"

describe "/admin/races" do

  scenario "admin sees list of all races" do
    admin = create(:user, role: 2)
    race_1, race_2 = create_list(:race, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path
    click_on "Manage Races"

    expect(current_path).to eq(admin_races_path)
    expect(page).to have_content("Manage Races")
    expect(page).to have_link("Add new race")
    expect(page).to have_content(race_1.title)
    expect(page).to have_content(race_2.title)
  end

  scenario "editor does not see list of all races" do
    editor = create(:user, role: 1)
    create_list(:race, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(editor)

    visit admin_races_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "normal user does not see list of all races" do
    user = create(:user, role: 0)
    create_list(:race, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_races_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "non-logged in user does not see list of all races" do
    user = create(:user, role: 0)
    create_list(:race, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_races_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

end
