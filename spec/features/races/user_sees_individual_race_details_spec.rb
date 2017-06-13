require "rails_helper"

describe "races/:id" do
  scenario "user sees individual race details" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    race = create(:race)

    visit race_path(race)

    expect(page).to have_content(race.city)
    expect(page).to have_content(race.state)
    expect(page).to have_content(race.street_address)
    expect(page).to have_content(race.title)
    expect(page).to have_content("Jul 26")
    expect(page).to have_content("Jul 30")
    expect(page).to have_content("General Information")
    expect(page).to have_content("Where to Stay")
    expect(page).to have_link("Sanction")
    expect(page).to have_link("Register")
    expect(page).to have_link("See others who are registered")
    expect(page).to have_content("Upcoming Events")
    expect(page).to have_content(race.details)
    expect(page).to have_content(race.hotel_information)
  end

  scenario "user does not see registration button for race that has passed" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    race = create(:race, title: "Race for the Kids", city: "Lake Alfred", state: "FL", start_date: '2017-04-21', end_date: '2017-04-23')

    visit race_path(race)

    expect(page).to have_link("Sanction")
    expect(page).to_not have_link("Register")
  end

  scenario "non-logged in user does not see registration button" do
    race = create(:race, title: "Race for the Kids", city: "Lake Alfred", state: "FL", start_date: Date.tomorrow, end_date: Date.tomorrow)

    visit race_path(race)

    expect(page).to have_link("Sanction")
    expect(page).to_not have_link("Register")
  end
end
