require "rails_helper"

describe "news/:id/edit" do
  scenario "user can edit existing news posting" do
    user = create(:user, role: 2)
    news = create(:news)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit news_path(news)

    click_on "Edit"

    expect(current_path).to eq(edit_news_path(news))

    fill_in "news[title]", with: "New Title"
    fill_in "news[content]", with: "New Content"
    select 2016
    select "November"
    select 26
    click_on "Update News"

    expect(page).to have_content("You have successfully updated this post.")
    expect(current_path).to eq(news_path(news))
    expect(page).to have_content("New Title")
    expect(page).to have_content("New Content")
    expect(page).to have_content("Nov 26, 2016")
  end
  scenario "user sees error if content is blank when updating news" do
    user = create(:user, role: 2)
    news = create(:news, author: user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit edit_news_path(news)

    fill_in "news[content]", with: nil

    click_on "Update News"

    expect(page).to have_content("Something went wrong. Content can't be blank. Please try your update again.")
  end
  scenario "user sees error if title is blank when updating news" do
    user = create(:user, role: 2)
    news = create(:news, author: user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit edit_news_path(news)

    fill_in "news[title]", with: nil

    click_on "Update News"

    expect(page).to have_content("Something went wrong. Title can't be blank. Please try your update again.")
  end
end
