require "rails_helper"

describe "/admin/photos/:id" do
  scenario "admin can delete photos" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    gallery = create(:gallery)
    create(:photo, gallery_id: gallery.id)

    visit edit_admin_gallery_path(gallery)

    click_on "Delete"

    expect(page).to have_content("This photo has been deleted.")
    expect(current_path).to eq(edit_admin_gallery_path(gallery))
  end

  scenario "editor cannot delete photos" do
    editor = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(editor)

    gallery = create(:gallery)
    create(:photo, gallery_id: gallery.id)

    visit edit_admin_gallery_path(gallery)

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "normal user cannot delete photos" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    gallery = create(:gallery)
    create(:photo, gallery_id: gallery.id)

    visit edit_admin_gallery_path(gallery)

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "non-logged in user cannot delete photos" do
    gallery = create(:gallery)
    create(:photo, gallery_id: gallery.id)

    visit edit_admin_gallery_path(gallery)

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

end
