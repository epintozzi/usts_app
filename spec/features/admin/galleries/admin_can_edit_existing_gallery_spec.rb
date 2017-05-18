require "rails_helper"

describe "admin/galleries/edit/:id" do
  scenario "admin can edit a gallery" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    gallery = create(:gallery, name: "Old Gallery")

    visit edit_admin_gallery_path(gallery)

    fill_in "gallery[name]", with: "New gallery"

    click_on "Update Gallery"

    expect(page).to have_content("This gallery has successfully been updated.")
    expect(page).to have_content("New gallery")
    expect(page).to_not have_content("Old Gallery")
    expect(current_path).to eq(admin_galleries_path)
  end

  scenario "admin sees error if name is missing" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    gallery = create(:gallery, name: "Old Name")

    visit edit_admin_gallery_path(gallery)

    fill_in "gallery[name]", with: ""

    click_on "Update Gallery"

    expect(page).to have_content("Something went wrong. Name can't be blank. Please try again.")
  end

  scenario "editor cannot edit a gallery" do
    editor = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(editor)

    gallery = create(:gallery, name: "Old Gallery")

    visit edit_admin_gallery_path(gallery)

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "normal user cannot edit a gallery" do
    user = create(:user, role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    gallery = create(:gallery, name: "Old Gallery")

    visit edit_admin_gallery_path(gallery)

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "non-logged in user cannot edit a gallery" do
    gallery = create(:gallery, name: "Old Gallery")

    visit edit_admin_gallery_path(gallery)

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
