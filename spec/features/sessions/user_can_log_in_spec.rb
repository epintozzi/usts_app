require "rails_helper"

describe "user log in" do
  scenario "user can log in" do
    User.create(first_name: "Erin", last_name: "Pintozzi", email: "erin@email.com", password: "password1")

    visit root_path
    click_on "Log in"

    expect(current_path).to eq(new_user_session_path)
    fill_in "user[email]", with: "erin@email.com"
    fill_in "user[password]", with: "password1"
    click_on "Log in"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Signed in successfully.")
  end

  scenario "user sees error if password is incorrect" do
    User.create(first_name: "Erin", last_name: "Pintozzi", email: "erin@email.com", password: "password1")

    visit root_path
    click_on "Log in"

    expect(current_path).to eq(new_user_session_path)
    fill_in "user[email]", with: "erin@email.com"
    fill_in "user[password]", with: "password"
    click_on "Log in"

    expect(current_path).to eq("/users/sign_in")
    expect(page).to have_content("Invalid Email or password.")
  end

  scenario "user sees error if email is incorrect" do
    User.create(first_name: "Erin", last_name: "Pintozzi", email: "erin@email.com", password: "password1")

    visit root_path
    click_on "Log in"

    expect(current_path).to eq(new_user_session_path)
    fill_in "user[email]", with: "erin1@email.com"
    fill_in "user[password]", with: "password1"
    click_on "Log in"

    expect(current_path).to eq("/users/sign_in")
    expect(page).to have_content("Invalid Email or password.")
  end
end
