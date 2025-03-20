require "rails_helper"

describe "/admin/photos/new" do
  scenario "admin can add photo to a gallery" do
    admin = create(:user, role: 2)
    gallery = create(:gallery)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_photo_path

    fill_in "photo[photographer]", with: "Photographer Name"
    fill_in "photo[caption]", with: "This is a caption"
    page.attach_file("photo_image", Rails.root + 'spec/assets/image.JPG')
    select gallery.name

    click_on "Add photo to gallery"

    expect(page).to have_content("This photo has successfully been added to #{gallery.name}")
    expect(page).to have_content(gallery.name)
    expect(current_path).to eq(gallery_path(gallery))
  end

  xscenario "admin sees error if image is missing" do
    admin = create(:user, role: 2)
    gallery = create(:gallery)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_photo_path

    select gallery.name

    click_on "Add photo to gallery"

    expect(page).to have_content("Something went wrong. Image can't be blank. Please try again.")
  end

  scenario "admin sees error if gallery is missing" do
    admin = create(:user, role: 2)
    create(:gallery)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_photo_path

    page.attach_file("photo_image", Rails.root + 'spec/assets/image.JPG')

    click_on "Add photo to gallery"

    expect(page).to have_content("Something went wrong. Gallery must exist Gallery can't be blank. Please try again.")
  end

  scenario "editor cannot create a image" do
    editor = create(:user, role: 1)
    create(:gallery)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(editor)

    visit new_admin_photo_path
    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "normal user cannot create a image" do
    user = create(:user, role: 0)
    create(:gallery)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_admin_photo_path
    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "non-logged in user cannot create a image" do
    visit new_admin_photo_path
    expect(page).to have_content("The page you were looking for doesn't exist")
  end

end
