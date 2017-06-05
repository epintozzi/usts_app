require "rails_helper"

describe "news date helper" do
  it "formats news date to month day year" do
    news = create(:news, published_on: '2017-04-21')

    formatted_date = helper.news_date(news.published_on)

    expect(formatted_date).to eq("Apr 21, 2017")
  end
end
