class Admin::NewsController < Admin::BaseController

  def index
    @news = News.all
  end

  def show
    @news = News.find(params[:id])
  end

  def new
    @news = News.new()
  end

  def create
    @news = News.new(news_params)
    if @news.save
      flash[:success] = "This news post has successfully been created."
      redirect_to admin_news_index_path
    else
      flash[:danger] = "Something went wrong. #{@news.errors.full_messages.join(' ')}. Please try again."
      render :new
    end
  end

  def edit
    @news = News.find(params[:id])
  end

  def update
    @news = News.find(params[:id])
    if @news.update(news_params)
      flash[:success] = "This news post has successfully been updated."
      redirect_to admin_news_index_path
    else
      flash[:danger] = "Something went wrong. #{@news.errors.full_messages.join(' ')}. Please try again."
      render :edit
    end
  end

  private

  def news_params
    params.require(:news).permit(:id, :title, :content, :author_id, :published_on, :image)
  end


end
