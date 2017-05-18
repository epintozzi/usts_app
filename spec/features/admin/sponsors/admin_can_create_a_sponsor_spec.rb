require "rails_helper"

describe "admin/sponsor/new" do
  scenario "admin can create a sponsor" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_sponsor_path

    fill_in "sponsor[name]", with: "DePue Men's Club"
    fill_in "sponsor[url]", with: "www.depue.com"
    page.attach_file("sponsor_image", Rails.root + 'spec/assets/image.JPG')

    click_on "Create Sponsor"

    expect(page).to have_content("This sponsor has successfully been created.")
    expect(page).to have_content("DePue Men's Club")
    expect(current_path).to eq(admin_sponsors_path)
  end

  scenario "admin sees error if a name is missing" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_sponsor_path

    fill_in "sponsor[url]", with: "www.depue.com"
    page.attach_file("sponsor_image", Rails.root + 'spec/assets/image.JPG')

    click_on "Create Sponsor"

    expect(page).to have_content("Something went wrong. Name can't be blank. Please try again.")
  end

  scenario "admin sees error if image is missing" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_sponsor_path

    fill_in "sponsor[name]", with: "DePue Men's Club"
    fill_in "sponsor[url]", with: "www.depue.com"

    click_on "Create Sponsor"

    expect(page).to have_content("Something went wrong. Image can't be blank. Please try again.")
  end

  scenario "editor cannot create a sponsor" do
    editor = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(editor)

    visit new_admin_sponsor_path
    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "normal user cannot create a sponsor" do
    user = create(:user, role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_admin_sponsor_path
    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "non-logged in user cannot create a sponsor" do
    visit new_admin_sponsor_path
    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
