require "rails_helper"

describe "/users/edit" do
  xscenario "user can edit their profile information" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
#problem - directing to log in page, not recognizing current user
    visit edit_user_registration_path

    fill_in "user[first_name]", with: "Bruce"
    fill_in "user[last_name]", with: "Doggo"
    fill_in "user[password]", with: user.password

    click_on "Update"
    expect(page).to have_content("You account has been updated successfully")
    expect(page).to have_content("Bruce")
    expect(current_path).to eq(root_path)
  end
end
