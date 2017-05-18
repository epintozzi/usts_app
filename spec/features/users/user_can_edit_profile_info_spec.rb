require "rails_helper"

describe "/users/edit" do
  xscenario "user can edit their profile information" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_user_session_path

    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    click_on "Log in"
    visit edit_user_registration_path

    fill_in "user[first_name]", with: "Bruce"
    fill_in "user[last_name]", with: "Doggo"
    fill_in "user[current_password]", with: user.password
    click_on "Update"
    #problem - not actually filling in fields

    expect(page).to have_content("Your account has been updated successfully.")
    expect(page).to have_content("Bruce")
    expect(current_path).to eq(root_path)
  end
end
