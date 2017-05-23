require "rails_helper"

describe "admin/galleries/:id" do
  scenario "admin can delete a gallery with no photos" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    create(:gallery)

    visit admin_galleries_path

    click_on "Delete"
    expect(page).to have_content("This gallery and all its photos have been deleted.")
  end
  scenario "admin can delete a gallery with photos" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    gallery = create(:gallery)
    photo = create(:photo, gallery_id: gallery.id)

    visit admin_galleries_path

    click_on "Delete"
    expect(page).to have_content("This gallery and all its photos have been deleted.")
  end
end
