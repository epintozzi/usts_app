class HomeController < ApplicationController

  def index
    @recent_news = News.all.order(published_on: :desc).limit(3)
  end

end
