require "rails_helper"

describe "/news/:id" do
  scenario "user sees individual news article" do
    news = create(:news)

    visit news_path(news)

    expect(page).to have_content(news.title)
    expect(page).to have_content(news.content)
    expect(page).to have_content(news.author.first_name)
    expect(page).to have_content(news.author.last_name)
    expect(page).to have_content(news.created_at)
  end
end
