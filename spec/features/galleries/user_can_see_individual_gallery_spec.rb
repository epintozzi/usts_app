require "rails_helper"

describe "/galleries/:id" do

  scenario "admin can see individual gallery" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    gallery = create(:gallery)
    create(:photo, gallery_id: gallery.id)

    visit galleries_path

    click_on gallery.name

    expect(current_path).to eq(gallery_path(gallery))
    expect(page).to have_content(gallery.name)
  end

  scenario "editor can see individual gallery" do
    editor = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(editor)

    gallery = create(:gallery)

    visit galleries_path

    click_on gallery.name

    expect(current_path).to eq(gallery_path(gallery))
    expect(page).to have_content(gallery.name)
  end

  scenario "normal user can see individual gallery" do
    user = create(:user, role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    gallery = create(:gallery)

    visit galleries_path

    click_on gallery.name

    expect(current_path).to eq(gallery_path(gallery))
    expect(page).to have_content(gallery.name)
  end

  scenario "non-logged in user can see individual gallery" do
    gallery = create(:gallery)

    visit galleries_path

    click_on gallery.name

    expect(current_path).to eq(gallery_path(gallery))
    expect(page).to have_content(gallery.name)
  end

  scenario "user sees notice if no photos in gallery" do
    gallery = create(:gallery)

    visit galleries_path

    click_on gallery.name

    expect(current_path).to eq(gallery_path(gallery))
    expect(page).to have_content("Sorry, it looks like nothing has been added to this gallery yet.")
  end
end
