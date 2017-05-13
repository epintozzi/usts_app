require "rails_helper"

describe "admin/boat_class/new" do
  scenario "admin can create a boat_class" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_boat_class_path

    fill_in "boat_class[class_name]", with: "KPro New"
    fill_in "boat_class[registration_fee]", with: 15

    click_on "Create Boat class"

    expect(page).to have_content("This boat class has successfully been created.")
    expect(page).to have_content("KPro New")
    expect(current_path).to eq(admin_boat_classes_path)
  end

  scenario "admin sees error if a class name is missing" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_boat_class_path

    fill_in "boat_class[registration_fee]", with: 25

    click_on "Create Boat class"

    expect(page).to have_content("Something went wrong. Class name can't be blank. Please try again.")
  end

  scenario "admin sees error if a registration_fee is missing" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_boat_class_path

    fill_in "boat_class[class_name]", with: "KPro 3"

    click_on "Create Boat class"

    expect(page).to have_content("Something went wrong. Registration fee can't be blank. Please try again.")
  end

  scenario "editor cannot create a boat_class" do
    editor = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(editor)

    visit new_admin_boat_class_path
    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "normal user cannot create a boat_class" do
    user = create(:user, role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_admin_boat_class_path
    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "non-logged in user cannot create a boat_class" do
    visit new_admin_boat_class_path
    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
