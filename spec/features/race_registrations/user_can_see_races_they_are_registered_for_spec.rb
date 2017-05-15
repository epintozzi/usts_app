require "rails_helper"


describe "/my_registrations" do

  scenario "user sees registrations for which they created the race registration" do
   user = create(:user, first_name: "Erin", last_name: "Pintozzi")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    usts_registration = create(:usts_registration, first_name: "Bruce", last_name: "Doggo")

    create(:race_registration, usts_registration_id: usts_registration.id, creator_id: user.id)

    visit my_registrations_path

    expect(page).to have_content("Registered by: Erin Pintozzi")
    expect(page).to have_content("Registrant: Bruce Doggo")
 end

  scenario "user sees registrations for which they created the usts registration but did not register user for the race" do
    user = create(:user, first_name: "Erin", last_name: "Pintozzi")
    user_2 = create(:user, first_name: "Tucker", last_name: "Puppy")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    usts_registration = create(:usts_registration, creator_id: user.id, first_name: "Bruce", last_name: "Doggo")

    create(:race_registration, usts_registration_id: usts_registration.id, creator_id: user_2.id)

    visit my_registrations_path

    expect(page).to have_content("Registered by: Tucker Puppy")
    expect(page).to have_content("Registrant: Bruce Doggo")
 end

  scenario "user sees registrations for which they created the usts registration and also registered user for the race" do
    user = create(:user, first_name: "Erin", last_name: "Pintozzi")
    user_2 = create(:user, first_name: "Tucker", last_name: "Puppy")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    usts_registration = create(:usts_registration, creator_id: user.id, first_name: "Bruce", last_name: "Doggo")

    create(:race_registration, usts_registration_id: usts_registration.id, creator_id: user.id)

    visit my_registrations_path

    expect(page).to have_content("Registered by: Erin Pintozzi")
    expect(page).to have_content("Registrant: Bruce Doggo")
 end

  scenario "user does not see registrations for which they did not create the usts reg (for race registration) or the race registration itself" do
    user = create(:user, first_name: "Erin", last_name: "Pintozzi")
    user_2 = create(:user, first_name: "Tucker", last_name: "Puppy")
    user_3 = create(:user, first_name: "Lola", last_name: "Jackson")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    usts_registration = create(:usts_registration, creator_id: user_2.id, first_name: "Bruce", last_name: "Doggo")

    create(:race_registration, usts_registration_id: usts_registration.id, creator_id: user_3.id)

    visit my_registrations_path

    expect(page).to_not have_content("Registered by: Lola Jackson")
    expect(page).to_not have_content("Registrant: Bruce Doggo")
 end

end
