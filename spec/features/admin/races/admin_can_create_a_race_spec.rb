require "rails_helper"

describe "admin/races/new" do
  scenario "admin can create a race" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_race_path

    fill_in "race[title]", with: "Race for the Kids"
    fill_in "race[street_address]", with: "123 Main St"
    fill_in "race[city]", with: "Lake Alfred"
    fill_in "race[state]", with: "FL"
    fill_in "race[fee_override]", with: 75

    within(:css, '.race-start') do
      select "2018"
      select "September"
      select "26"
    end

    within(:css, '.race-end') do
      select "2018"
      select "September"
      select "28"
    end

    # fill_in "race[sanction]", with: "sanction.pdf" -- will be upload field
    fill_in "race[details]", with: "Race details go here"
    fill_in "race[hotel_information]", with: "Hotel info goes here"
    click_on "Create Race"

    expect(page).to have_content("This race has successfully been created.")
    expect(page).to have_content("Race for the Kids")
    expect(current_path).to eq(admin_races_path)
  end

  scenario "admin sees error if a title is missing" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_race_path

    fill_in "race[street_address]", with: "123 Main St"
    fill_in "race[city]", with: "Lake Alfred"
    fill_in "race[state]", with: "FL"
    fill_in "race[fee_override]", with: 75

    within(:css, '.race-start') do
      select "2018"
      select "September"
      select "26"
    end
    within(:css, '.race-end') do
      select "2018"
      select "September"
      select "28"
    end
    fill_in "race[details]", with: "Race details go here"
    fill_in "race[hotel_information]", with: "Hotel info goes here"
    click_on "Create Race"

    expect(page).to have_content("Something went wrong. Title can't be blank. Please try again.")
  end

  scenario "admin sees error if a city is missing" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_race_path

    fill_in "race[title]", with: "Race for the Kids"
    fill_in "race[street_address]", with: "123 Main St"
    fill_in "race[state]", with: "FL"
    fill_in "race[fee_override]", with: 75

    within(:css, '.race-start') do
      select "2018"
      select "September"
      select "26"
    end
    within(:css, '.race-end') do
      select "2018"
      select "September"
      select "28"
    end
    fill_in "race[details]", with: "Race details go here"
    fill_in "race[hotel_information]", with: "Hotel info goes here"
    click_on "Create Race"

    expect(page).to have_content("Something went wrong. City can't be blank. Please try again.")
  end

  scenario "admin sees error if a state is missing" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_race_path

    fill_in "race[title]", with: "Race for the Kids"
    fill_in "race[street_address]", with: "123 Main St"
    fill_in "race[city]", with: "Lake Alfred"
    # fill_in "race[state]", with: "FL"
    fill_in "race[fee_override]", with: 75

    within(:css, '.race-start') do
      select "2018"
      select "September"
      select "26"
    end
    within(:css, '.race-end') do
      select "2018"
      select "September"
      select "28"
    end
    fill_in "race[details]", with: "Race details go here"
    fill_in "race[hotel_information]", with: "Hotel info goes here"
    click_on "Create Race"

    expect(page).to have_content("Something went wrong. State can't be blank. Please try again.")
  end

  scenario "editor cannot create a race" do
    editor = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(editor)

    visit new_admin_race_path
    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "normal user cannot create a race" do
    user = create(:user, role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_admin_race_path
    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "non-logged in user cannot create a race" do
    visit new_admin_race_path
    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
