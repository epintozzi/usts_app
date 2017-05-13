require "rails_helper"

describe "/admin/sponsors" do

  scenario "admin sees list of all sponsors" do
    admin = create(:user, role: 2)
    sponsor_1, sponsor_2 = create_list(:sponsor, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path
    click_on "Manage Sponsors"

    expect(current_path).to eq(admin_sponsors_path)
    expect(page).to have_content("Manage Sponsors")
    expect(page).to have_link("Add new sponsor")
    expect(page).to have_link("Edit")
    expect(page).to have_content(sponsor_1.name)
    expect(page).to have_content(sponsor_2.name)
  end

  scenario "editor does not see list of all sponsors" do
    editor = create(:user, role: 1)
    create_list(:sponsor, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(editor)

    visit admin_sponsors_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "normal user does not see list of all sponsors" do
    user = create(:user, role: 0)
    create_list(:sponsor, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_sponsors_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "non-logged in user does not see list of all sponsors" do
    user = create(:user, role: 0)
    create_list(:sponsor, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_sponsors_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

end
