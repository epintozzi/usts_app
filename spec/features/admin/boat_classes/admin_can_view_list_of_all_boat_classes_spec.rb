require "rails_helper"

describe "/admin/boat_classes" do

  scenario "admin sees list of all boat_classes" do
    admin = create(:user, role: 2)
    boat_class_1, boat_class_2 = create_list(:boat_class, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path
    click_on "Manage Boat Classes"

    expect(current_path).to eq(admin_boat_classes_path)
    expect(page).to have_content("Manage Boat Classes")
    expect(page).to have_link("Add boat class")
    expect(page).to have_link("Edit")
    expect(page).to have_content(boat_class_1.class_name)
    expect(page).to have_content(boat_class_2.class_name)
  end

  scenario "editor does not see list of all boat_classes" do
    editor = create(:user, role: 1)
    create_list(:boat_class, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(editor)

    visit admin_boat_classes_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "normal user does not see list of all boat_classes" do
    user = create(:user, role: 0)
    create_list(:boat_class, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_boat_classes_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "non-logged in user does not see list of all boat_classes" do
    user = create(:user, role: 0)
    create_list(:boat_class, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_boat_classes_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

end
