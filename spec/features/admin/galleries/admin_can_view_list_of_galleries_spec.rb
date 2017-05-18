require "rails_helper"

describe "/admin/galleries" do

  scenario "admin sees list of all galleries" do
    admin = create(:user, role: 2)
    gallery_1, gallery_2 = create_list(:gallery, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path
    click_on "Manage Galleries"

    expect(current_path).to eq(admin_galleries_path)
    expect(page).to have_content("Manage Galleries")
    expect(page).to have_link("Add new gallery")
    expect(page).to have_link("Edit")
    expect(page).to have_content(gallery_1.name)
    expect(page).to have_content(gallery_2.name)
  end

  scenario "editor does not see list of all galleries" do
    editor = create(:user, role: 1)
    create_list(:gallery, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(editor)

    visit admin_galleries_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "normal user does not see list of all galleries" do
    user = create(:user, role: 0)
    create_list(:gallery, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_galleries_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "non-logged in user does not see list of all galleries" do
    user = create(:user, role: 0)
    create_list(:gallery, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_galleries_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

end
