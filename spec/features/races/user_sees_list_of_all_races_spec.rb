require "rails_helper"

describe "/races" do
  scenario "user sees list of all races for season" do
    race = create(:race)
    race2 = Race.create(city: "Denver", state: "CO", start_date: "2017-06-26 16:33:57", end_date: "2017-06-26 16:33:57")

    visit races_path

    expect(page).to have_content(race.city)
    expect(page).to have_content(race.state)
    expect(page).to have_content(race.start_date)
    expect(page).to have_content(race.end_date)
    expect(page).to have_content(race2.city)
    expect(page).to have_content(race2.state)
    expect(page).to have_content(race2.start_date)
    expect(page).to have_content(race2.end_date)
    expect(page).to have_link("Details")
    expect(page).to have_link("Register")
  end
  scenario "user can access race details via the index page" do
    race = create(:race)

    visit races_path
    click_on "Details"

    expect(current_path).to eq(race_path(race))
  end
end
