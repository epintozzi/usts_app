require "rails_helper"

describe "/news/:id" do
  scenario "user sees individual news article" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    news = create(:news)

    visit news_path(news)

    expect(page).to have_content(news.title)
    expect(page).to have_content(news.content)
    expect(page).to have_content(news.author.first_name)
    expect(page).to have_content(news.author.last_name)
    expect(page).to have_content(news.published_on.strftime("%b %-d, %Y"))
  end
end
