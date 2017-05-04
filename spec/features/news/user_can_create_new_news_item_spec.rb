require "rails_helper"

describe "authorized user creates news post" do

  scenario "editor can create a new news post" do
    user = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit news_index_path

    click_on "Add News Post"
    expect(current_path).to eq(new_news_path)

    fill_in "news[title]", with: "Title"
    fill_in "news[content]", with: "This is content"

    click_on "Create News"

    news = News.last

    expect(current_path).to eq(news_path(news))
    expect(page).to have_content("Your news post has been successfully created.")
    expect(page).to have_content(news.title)
    expect(page).to have_content(news.content)
  end

  scenario "admin can create a new news post" do
    user = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit news_index_path

    click_on "Add News Post"
    expect(current_path).to eq(new_news_path)

    fill_in "news[title]", with: "Title"
    fill_in "news[content]", with: "This is content"

    click_on "Create News"

    news = News.last

    expect(current_path).to eq(news_path(news))
    expect(page).to have_content("Your news post has been successfully created.")
    expect(page).to have_content(news.title)
    expect(page).to have_content(news.content)
  end

  scenario "user sees error if title is blank when creating news" do
    user = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_news_path

    fill_in "news[content]", with: "This is content"

    click_on "Create News"

    expect(page).to have_content("Something went wrong. Title can't be blank. Please try again.")
  end
  scenario "user sees error if content is blank when creating news" do
    user = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_news_path

    fill_in "news[title]", with: "Title"

    click_on "Create News"

    expect(page).to have_content("Something went wrong. Content can't be blank. Please try again.")
  end

  scenario "unauthorized user cannot create a news item" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit news_index_path

    expect(page).to_not have_link("Add News Post")
  end

  scenario "non-logged in user cannot create a news item" do
    visit news_index_path

    expect(page).to_not have_link("Add News Post")
  end
end
