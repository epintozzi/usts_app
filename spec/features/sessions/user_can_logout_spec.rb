require "rails_helper"

describe "user log out" do
  scenario "user can log out" do
    User.create(first_name: "Erin", last_name: "Pintozzi", email: "erin@email.com", password: "password1")

    visit root_path
    expect(page).to have_content("Log in")
    expect(page).to have_content("Sign Up")

    click_on "Log in"

    expect(current_path).to eq(new_user_session_path)

    fill_in "user[email]", with: "erin@email.com"
    fill_in "user[password]", with: "password1"
    click_on "Log in"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Logout")
    expect(page).to_not have_content("Log in")
    expect(page).to_not have_content("Sign Up")

    click_on("Logout")

    expect(page).to have_content("Signed out successfully.")
    expect(page).to have_content("Log in")
    expect(page).to have_content("Sign Up")
  end
end
