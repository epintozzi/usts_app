require "rails_helper"

describe "/admin/news" do

  scenario "admin sees list of all news" do
    admin = create(:user, role: 2)
    news_1, news_2 = create_list(:news, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path
    click_on "Manage News"

    expect(current_path).to eq(admin_news_index_path)
    expect(page).to have_content("Manage News")
    expect(page).to have_link("Add news post")
    expect(page).to have_link("Edit")
    expect(page).to have_link("View")
    expect(page).to have_content(news_1.title)
    expect(page).to have_content(news_2.title)
  end

  scenario "editor does not see list of all news" do
    editor = create(:user, role: 1)
    create_list(:race, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(editor)

    visit admin_news_index_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "normal user does not see list of all news" do
    user = create(:user, role: 0)
    create_list(:race, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_news_index_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "non-logged in user does not see list of all news" do
    user = create(:user, role: 0)
    create_list(:race, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_news_index_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

end
