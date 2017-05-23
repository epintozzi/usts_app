require "rails_helper"

describe "/photos/:id" do
  scenario "normal user sees photo and details" do
    admin = create(:user, role: 2)
    gallery = create(:gallery)
    photo = create(:photo, gallery_id: gallery.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit photo_path(photo)

    expect(page).to have_content(photo.photographer)
    expect(page).to have_content(photo.caption)
    expect(page).to have_css("img[src*='#{photo.image}']")
  end
  scenario "normal user sees photo and details" do
    editor = create(:user, role: 1)
    gallery = create(:gallery)
    photo = create(:photo, gallery_id: gallery.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(editor)

    visit photo_path(photo)

    expect(page).to have_content(photo.photographer)
    expect(page).to have_content(photo.caption)
    expect(page).to have_css("img[src*='#{photo.image}']")
  end
  scenario "normal user sees photo and details" do
    user = create(:user)
    gallery = create(:gallery)
    photo = create(:photo, gallery_id: gallery.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit photo_path(photo)

    expect(page).to have_content(photo.photographer)
    expect(page).to have_content(photo.caption)
    expect(page).to have_css("img[src*='#{photo.image}']")
  end

  scenario "non-logged in user sees photo and details" do
    gallery = create(:gallery)
    photo = create(:photo, gallery_id: gallery.id)

    visit photo_path(photo)

    expect(page).to have_content(photo.photographer)
    expect(page).to have_content(photo.caption)
    expect(page).to have_css("img[src*='#{photo.image}']")
  end
end
