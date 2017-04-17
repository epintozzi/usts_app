require "rails_helper"

describe "news index" do
  scenario "user sees list of all news articles" do
    news_article = create(:news)

    visit news_index_path

    expect(page).to have_content(news_article.title)
    expect(page).to have_content(news_article.content)
    expect(page).to have_content(news_article.author.first_name)
    expect(page).to have_content(news_article.author.last_name)
    expect(page).to have_link("#{news_article.title}")
  end
end
