require "rails_helper"

describe "/galleries" do
  scenario "admin user sees list of galleries" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    gallery_1, gallery_2 = create_list(:gallery, 2)

    visit galleries_path

    expect(page).to have_content(gallery_1.name)
    expect(page).to have_content(gallery_2.name)
  end

  scenario "editor user sees list of galleries" do
    editor = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(editor)

    gallery_1, gallery_2 = create_list(:gallery, 2)

    visit galleries_path

    expect(page).to have_content(gallery_1.name)
    expect(page).to have_content(gallery_2.name)
  end

  scenario "normal user sees list of galleries" do
    user = create(:user, role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    gallery_1, gallery_2 = create_list(:gallery, 2)

    visit galleries_path

    expect(page).to have_content(gallery_1.name)
    expect(page).to have_content(gallery_2.name)
  end

  scenario "non-logged in user sees list of galleries" do
    gallery_1, gallery_2 = create_list(:gallery, 2)

    visit galleries_path

    expect(page).to have_content(gallery_1.name)
    expect(page).to have_content(gallery_2.name)
  end

end
