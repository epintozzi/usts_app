class NewsController < ApplicationController
  load_and_authorize_resource only: [:new, :create, :edit, :update]

  def index
    @all_news = News.all.order(published_on: :desc)
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
      flash[:alert] = "Something went wrong. #{@news.errors.full_messages.join(' ')}. Please try again."
      render :new
    end
  end

  def edit
    @news = News.find(params[:id])
  end

  def update
    @news = News.find(params[:id])
    if @news.update(news_params)
      flash[:success] = "You have successfully updated this post."
      redirect_to news_path(@news)
    else
      flash[:alert] = "Something went wrong. #{@news.errors.full_messages.join(' ')}. Please try your update again."
      render :edit
    end
  end

  private

  def news_params
    params.require(:news).permit(:id, :title, :content, :author_id, :published_on)
  end

end
