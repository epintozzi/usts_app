require "rails_helper"

describe "unpaid registrations" do
  xscenario "user sees list of unpaid race registrations" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    usts_reg = create(:usts_registration, creator_id: user.id, first_name: "Erin")
    race_1, race_2 = create_list(:race, 2)
    race_reg_1 = create(:race_registration, usts_registration_id: usts_reg.id, race_id: race_1.id)
    race_reg_2 = create(:race_registration, usts_registration_id: usts_reg.id, race_id: race_2.id)


    visit my_registrations_path

    expect(page).to have_content("My Race Registrations")
    # save_and_open_page
    binding.pry
    expect(page).to have_content(race_reg_1.race.title)
    expect(page).to have_content(race_reg_1.race.city)
    expect(page).to have_content(race_reg_1.race.state)
    expect(page).to have_content(race_reg_2.race.title)
    expect(page).to have_content(race_reg_2.race.city)
    expect(page).to have_content(race_reg_2.race.state)
  end

  xscenario "user sees list of unpaid membership registrations" do

  end
end
