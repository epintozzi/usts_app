require "rails_helper"

describe "/news/edit/:id" do
  scenario "editor can access Edit News form" do
    user = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    news = create(:news)
    visit edit_news_path(news)

    expect(page).to have_content("Update a News Post")
    expect(current_path).to eq(edit_news_path(news))
  end
  scenario "admin can access Edit News form" do
    user = create(:user, role: 2)
    news = create(:news)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit edit_news_path(news)

    expect(page).to have_content("Update a News Post")
    expect(current_path).to eq(edit_news_path(news))
  end
  xscenario "normal user cannot access Edit News form" do
    user = create(:user, role: 0)
    news = create(:news)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit edit_news_path(news)

    expect(page).to have_content("You are not authorized to access this page")
    expect(current_path).to eq(root_path)
  end
  xscenario "non-logged in user cannot access Edit News form" do
    news = create(:news)
    visit edit_news_path(news)

    expect(page).to have_content("You are not authorized to access this page")
    expect(current_path).to eq(root_path)
  end
end
