class NewsController < ApplicationController

  def index
    @all_news = News.all.reverse
  end

  def show
    @news = News.find(params[:id])
  end

  def new
    @news = News.new()
  end

  def create
    @news = News.new(news_params)
    @news.author = current_user
    if @news.save
      flash[:success] = "Your news post has been successfully created."
      redirect_to news_path(@news)
    else
      flash[:alert] = "Something went wrong. Please try again."
      render :new
    end
  end

  private

  def news_params
    params.require(:news).permit(:id, :title, :content, :author_id)
  end

end
