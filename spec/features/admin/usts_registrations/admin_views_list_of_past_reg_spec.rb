require "rails_helper"

describe "/admin/usts_registrations" do

  scenario "admin can access list of usts registrations" do
    admin = create(:user, role: 2)
    reg_1, reg_2 = create_list(:usts_registration, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_membership_archives_index_path

    expect(current_path).to eq(admin_membership_archives_index_path)
    expect(page).to have_content(reg_1.first_name)
    expect(page).to have_content(reg_2.first_name)
  end

  scenario "editor cannot access list of usts registrations" do
    editor = create(:user, role: 1)
    create_list(:usts_registration, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(editor)

    visit admin_membership_archives_index_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "normal user cannot access list of usts registrations" do
    user = create(:user, role: 0)
    create_list(:usts_registration, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_membership_archives_index_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "non-logged in user cannot access list of usts registrations" do
    create_list(:usts_registration, 2)

    visit admin_membership_archives_index_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

end
