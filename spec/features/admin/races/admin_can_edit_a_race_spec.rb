require "rails_helper"

describe "admin/races/edit/:id" do
  scenario "admin can edit a race" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    race = create(:race, title: "Old Race Title")

    visit edit_admin_race_path(race)

    fill_in "race[title]", with: "New Race Title"

    fill_in "race[hotel_information]", with: "Hotel info goes here"
    click_on "Update Race"

    expect(page).to have_content("This race has successfully been updated.")
    expect(page).to have_content("New Race Title")
    expect(page).to_not have_content("Old Race Title")
    expect(current_path).to eq(admin_races_path)
  end

  scenario "admin sees error if a title is missing" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    race = create(:race, title: "Old Race Title")

    visit edit_admin_race_path(race)

    fill_in "race[title]", with: ""

    click_on "Update Race"

    expect(page).to have_content("Something went wrong. Title can't be blank. Please try again.")
  end

  scenario "admin sees error if a city is missing" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    race = create(:race, title: "Old Race Title")

    visit edit_admin_race_path(race)

    fill_in "race[city]", with: ""

    click_on "Update Race"

    expect(page).to have_content("Something went wrong. City can't be blank. Please try again.")
  end

  scenario "admin sees error if a state is missing" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    race = create(:race, title: "Old Race Title")

    visit edit_admin_race_path(race)

    fill_in "race[state]", with: ""

    click_on "Update Race"

    expect(page).to have_content("Something went wrong. State can't be blank. Please try again.")
  end

  scenario "editor cannot edit a race" do
    editor = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(editor)

    race = create(:race, title: "Old Race Title")

    visit edit_admin_race_path(race)

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "normal user cannot edit a race" do
    user = create(:user, role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    race = create(:race, title: "Old Race Title")

    visit edit_admin_race_path(race)

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "non-logged in user cannot edit a race" do
    race = create(:race, title: "Old Race Title")

    visit edit_admin_race_path(race)

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
