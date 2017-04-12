require "rails_helper"

describe "user sign up" do
  scenario "user can create an account" do
    visit root_path
    click_on "Sign Up"

    expect(current_path).to eq(new_user_path)
    fill_in "user[email]", with: "erin@email.com"
    fill_in "user[first_name]", with: "Erin"
    fill_in "user[last_name]", with: "Pintozzi"
    fill_in "user[password]", with: "password1"
    fill_in "user[password_confirmation]", with: "password1"
    # fill_in "user[driver?]", with: "yes" Change to a select yes/no for driver
    click_on "Create User"

    user = User.last

    expect(page).to have_content("You have successfully created an account")
    expect(current_path).to eq(user_path(user))
  end
end
