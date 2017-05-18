require "rails_helper"

describe "admin/gallery/new" do
  scenario "admin can create a gallery" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_gallery_path

    fill_in "gallery[name]", with: "Gallery Name"

    click_on "Create Gallery"

    expect(page).to have_content("This gallery has successfully been created.")
    expect(page).to have_content("Gallery Name")
    expect(current_path).to eq(admin_galleries_path)
  end

  scenario "admin sees error if a name is missing" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_gallery_path

    fill_in "gallery[name]", with: ""

    click_on "Create Gallery"

    expect(page).to have_content("Something went wrong. Name can't be blank. Please try again.")
  end

  scenario "editor cannot create a gallery" do
    editor = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(editor)

    visit new_admin_gallery_path
    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "normal user cannot create a gallery" do
    user = create(:user, role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_admin_gallery_path
    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "non-logged in user cannot create a gallery" do
    visit new_admin_gallery_path
    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
