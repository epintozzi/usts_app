require "rails_helper"

describe "/races" do
  scenario "user sees list of all races for season" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    race = create(:race)
    race2 = Race.create(city: "Denver", state: "CO", start_date: "2017-06-26 16:33:57", end_date: "2017-06-26 16:33:57", title: "New race")

    visit races_path

    expect(page).to have_content(race.city)
    expect(page).to have_content(race.state)
    expect(page).to have_content(race.start_date.strftime("%b %-d"))
    expect(page).to have_content(race.end_date.strftime("%b %-d"))
    expect(page).to have_content(race2.city)
    expect(page).to have_content(race2.state)
    expect(page).to have_content(race2.start_date.strftime("%b %-d"))
    expect(page).to have_content(race2.end_date.strftime("%b %-d"))
    expect(page).to have_link("Details")
    expect(page).to have_link("Register")
  end

  scenario "user can access race details via the index page" do
    race = create(:race)

    visit races_path
    click_on "Details"

    expect(current_path).to eq(race_path(race))
  end

  scenario "user does not see registration button for past races" do
    create(:race, title: "Race for the Kids", city: "Lake Alfred", state: "FL", start_date: '2017-04-21', end_date: '2017-04-23')

    visit races_path

    expect(page).to have_link("Details")
    expect(page).to_not have_link("Register")
  end

  scenario "non-logged in user does not see registration button" do
    create(:race, title: "Race for the Kids", city: "Lake Alfred", state: "FL", start_date: Date.tomorrow, end_date: Date.tomorrow)

    visit races_path

    expect(page).to_not have_link("Register")
  end
end
