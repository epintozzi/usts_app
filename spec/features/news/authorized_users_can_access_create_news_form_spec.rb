require "rails_helper"

describe "/news/new" do
  scenario "editor can access Create News form" do
    user = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_news_path

    expect(page).to have_content("Create a News Post")
    expect(current_path).to eq(new_news_path)
  end
  scenario "admin can access Create News form" do
    user = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_news_path

    expect(page).to have_content("Create a News Post")
    expect(current_path).to eq(new_news_path)
  end
  xscenario "normal user cannot access Create News form" do
    user = create(:user, role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_news_path

    expect(page).to have_content("You are not authorized to access this page")
    expect(current_path).to eq(root_path)
  end
  xscenario "non-logged in user cannot access Create News form" do
    visit new_news_path

    expect(page).to have_content("You are not authorized to access this page")
    expect(current_path).to eq(root_path)
  end
end
