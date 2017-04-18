require "rails_helper"

describe "races/:id" do
  scenario "user sees individual race details" do
    race = create(:race)

    visit race_path(race)

    expect(page).to have_content(race.city)
    expect(page).to have_content(race.state)
    expect(page).to have_content(race.street_address)
    expect(page).to have_content(race.start_date)
    expect(page).to have_content(race.end_date)
    expect(page).to have_content(race.end_date)
    expect(page).to have_content("General Information")
    expect(page).to have_content("Where to Stay")
    expect(page).to have_link("See others who are registered")
    expect(page).to have_content("Upcoming Events")
    expect(page).to have_content(race.details)
    expect(page).to have_content(race.hotel_information)
  end
end
