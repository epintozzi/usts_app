require "rails_helper"

describe "admin/sponsors/edit/:id" do
  scenario "admin can edit a sponsor" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    sponsor = create(:sponsor, name: "Old Sponsor", image: "image.jpg")

    visit edit_admin_sponsor_path(sponsor)

    fill_in "sponsor[name]", with: "New sponsor"
    fill_in "sponsor[image]", with: "image.jpg"
    fill_in "sponsor[url]", with: "www.depue.com"

    click_on "Update Sponsor"

    expect(page).to have_content("This sponsor has successfully been updated.")
    expect(page).to have_content("New sponsor")
    expect(page).to_not have_content("Old Sponsor")
    expect(current_path).to eq(admin_sponsors_path)
  end

  scenario "admin sees error if name is missing" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    sponsor = create(:sponsor, name: "Old sponsor name")

    visit edit_admin_sponsor_path(sponsor)

    fill_in "sponsor[name]", with: ""

    click_on "Update Sponsor"

    expect(page).to have_content("Something went wrong. Name can't be blank. Please try again.")
  end

  scenario "admin sees error if a image is missing" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    sponsor = create(:sponsor, name: "Old Class Name")

    visit edit_admin_sponsor_path(sponsor)

    fill_in "sponsor[image]", with: ""

    click_on "Update Sponsor"

    expect(page).to have_content("Something went wrong. Image can't be blank. Please try again.")
  end

  scenario "editor cannot edit a sponsor" do
    editor = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(editor)

    sponsor = create(:sponsor, name: "Old Boat Class")

    visit edit_admin_sponsor_path(sponsor)

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "normal user cannot edit a sponsor" do
    user = create(:user, role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    sponsor = create(:sponsor, name: "Old Boat Class")

    visit edit_admin_sponsor_path(sponsor)

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "non-logged in user cannot edit a sponsor" do
    sponsor = create(:sponsor, name: "Old Boat Class")

    visit edit_admin_sponsor_path(sponsor)

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
