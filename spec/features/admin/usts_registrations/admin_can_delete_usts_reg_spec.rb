require "rails_helper"

describe "/admin/usts_registrations/:id" do
  scenario "admin can delete a usts registration" do
    admin = create(:user, role: 2)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    race_year = if Race.races_this_year.future.empty? && (Date.today > Date.parse('October 1'))
                  Date.current.next_year.year
                else
                  Date.current.year
                end

    create(:usts_registration, race_year: race_year)

    visit admin_usts_registrations_path

    click_on "Delete"

    expect(page).to have_content("This USTS Member registration has been deleted.")
    expect(current_path).to eq(admin_usts_registrations_path)
  end
  scenario "admin sees error when trying to delete a usts registration with associated race registrations" do
    admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    usts_reg = create(:usts_registration)
    create(:race_registration, usts_registration_id: usts_reg.id)

    visit admin_usts_registrations_path

    click_on "Delete"

    expect(page).to have_content("Cannot delete a USTS Membership that is associated with a current race registration")
    expect(current_path).to eq(admin_usts_registrations_path)
  end
  scenario "editor cannot delete a usts registration" do
    editor = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(editor)

    create(:usts_registration)

    visit admin_usts_registrations_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
  scenario "normal user cannot delete a usts registration" do
    user = create(:user, role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    create(:usts_registration)

    visit admin_usts_registrations_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
  scenario "non-logged in user cannot delete a usts registration" do
    create(:usts_registration)

    visit admin_usts_registrations_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

end
