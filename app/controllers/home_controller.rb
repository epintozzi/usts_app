class HomeController < ApplicationController

  def index
    @recent_news = News.last(3)
  end

end
