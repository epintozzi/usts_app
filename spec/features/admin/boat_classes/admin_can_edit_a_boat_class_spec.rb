require "rails_helper"

describe "admin/boat_classes/edit/:id" do
  scenario "admin can edit a boat_class" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    boat_class = create(:boat_class, class_name: "KPro 4", registration_fee: 5)

    visit edit_admin_boat_class_path(boat_class)

    fill_in "boat_class[class_name]", with: "125 Hydro"

    fill_in "boat_class[registration_fee]", with: 10
    click_on "Update Boat class"

    expect(page).to have_content("This boat class has successfully been updated.")
    expect(page).to have_content("125 Hydro")
    expect(page).to_not have_content("KPro 4")
    expect(page).to have_content("$10.00")
    expect(page).to_not have_content("$5.00")
    expect(current_path).to eq(admin_boat_classes_path)
  end

  scenario "admin sees error if a class name is missing" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    boat_class = create(:boat_class, class_name: "Old class name")

    visit edit_admin_boat_class_path(boat_class)

    fill_in "boat_class[class_name]", with: ""

    click_on "Update Boat class"

    expect(page).to have_content("Something went wrong. Class name can't be blank. Please try again.")
  end

  scenario "admin sees error if a registration_fee is missing" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    boat_class = create(:boat_class, class_name: "Old Class Name")

    visit edit_admin_boat_class_path(boat_class)

    fill_in "boat_class[registration_fee]", with: ""

    click_on "Update Boat class"

    expect(page).to have_content("Something went wrong. Registration fee can't be blank. Please try again.")
  end

  scenario "editor cannot edit a boat_class" do
    editor = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(editor)

    boat_class = create(:boat_class, class_name: "Old Boat Class")

    visit edit_admin_boat_class_path(boat_class)

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "normal user cannot edit a boat_class" do
    user = create(:user, role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    boat_class = create(:boat_class, class_name: "Old Boat Class")

    visit edit_admin_boat_class_path(boat_class)

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "non-logged in user cannot edit a boat_class" do
    boat_class = create(:boat_class, class_name: "Old Boat Class")

    visit edit_admin_boat_class_path(boat_class)

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
