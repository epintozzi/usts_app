require "rails_helper"

describe "user sign up" do
  scenario "user can create an account" do
    visit root_path
    click_on "Sign Up"

    expect(current_path).to eq(new_user_registration_path)
    fill_in "user[first_name]", with: "Erin"
    fill_in "user[last_name]", with: "Pintozzi"
    fill_in "user[email]", with: "erin@email.com"
    fill_in "user[password]", with: "password1"
    fill_in "user[password_confirmation]", with: "password1"
    # fill_in "user[driver?]", with: "yes" Change to a select yes/no for driver
    click_on "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(current_path).to eq(root_path)
  end

  scenario "user sees error if passwords do not match" do
    visit root_path
    click_on "Sign Up"

    expect(current_path).to eq(new_user_registration_path)
    fill_in "user[email]", with: "erin@email.com"
    fill_in "user[first_name]", with: "Erin"
    fill_in "user[last_name]", with: "Pintozzi"
    fill_in "user[password]", with: "password1"
    fill_in "user[password_confirmation]", with: "password"
    # fill_in "user[driver?]", with: "yes" Change to a select yes/no for driver
    click_on "Sign up"

    expect(page).to have_content("Sign up 1 error prohibited this user from being saved: Password confirmation doesn't match")
    expect(current_path).to eq("/users")
  end

  scenario "user sees error if email is blank" do
    visit root_path
    click_on "Sign Up"

    expect(current_path).to eq(new_user_registration_path)
    fill_in "user[email]", with: ""
    fill_in "user[first_name]", with: "Erin"
    fill_in "user[last_name]", with: "Pintozzi"
    fill_in "user[password]", with: "password1"
    fill_in "user[password_confirmation]", with: "password1"
    # fill_in "user[driver?]", with: "yes" Change to a select yes/no for driver
    click_on "Sign up"

    expect(page).to have_content("Sign up 1 error prohibited this user from being saved: Email can't be blank")
    expect(current_path).to eq("/users")
  end

  scenario "user sees error if email is already used by someone else" do
    User.create(first_name: "Ryan", last_name: "Barth", email: "erin@email.com", password: "password")

    visit root_path
    click_on "Sign Up"

    expect(current_path).to eq(new_user_registration_path)
    fill_in "user[email]", with: "erin@email.com"
    fill_in "user[first_name]", with: "Erin"
    fill_in "user[last_name]", with: "Pintozzi"
    fill_in "user[password]", with: "password1"
    fill_in "user[password_confirmation]", with: "password1"
    # fill_in "user[driver?]", with: "yes" Change to a select yes/no for driver
    click_on "Sign up"

    expect(page).to have_content("Sign up 1 error prohibited this user from being saved: Email has already been taken")
    expect(current_path).to eq("/users")
  end

  xscenario "user sees error if first name is blank" do
    visit root_path
    click_on "Sign Up"

    expect(current_path).to eq(new_user_registration_path)
    fill_in "user[email]", with: "erin@email.com"
    fill_in "user[first_name]", with: ""
    fill_in "user[last_name]", with: "Pintozzi"
    fill_in "user[password]", with: "password1"
    fill_in "user[password_confirmation]", with: "password1"
    # fill_in "user[driver?]", with: "yes" Change to a select yes/no for driver
    click_on "Sign up"

    expect(page).to have_content("Sign up 1 error prohibited this user from being saved: First name can't be blank")
    expect(current_path).to eq("/users")
  end

  xscenario "user sees error if last name is blank" do
    visit root_path
    click_on "Sign Up"

    expect(current_path).to eq(new_user_registration_path)
    fill_in "user[email]", with: "erin@email.com"
    fill_in "user[first_name]", with: "Erin"
    fill_in "user[last_name]", with: ""
    fill_in "user[password]", with: "password1"
    fill_in "user[password_confirmation]", with: "password1"
    # fill_in "user[driver?]", with: "yes" Change to a select yes/no for driver
    click_on "Sign up"

    expect(page).to have_content("Sign up 1 error prohibited this user from being saved: Last name can't be blank")
    expect(current_path).to eq("/users")
  end
end
