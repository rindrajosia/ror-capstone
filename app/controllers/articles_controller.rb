class ArticlesController < ApplicationController
  before_action :current_user
  def index
    @articles = Article.all
    @popular_article = Vote.popular_article
    @categories = Categorie.priority_ordered
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.authorid = current_user.id
    tag_ids = params[:tag_ids]
    if tag_ids.nil?
      tag_ids = []
      tag_ids << 1
    end
    if @article.save && !@article.image.nil?
      tag_ids.each do |t|
        @cat = Categorie.find(t)
        @ac = Tag.create(article_id: @article.id, category_id: @cat.id)
        @ac.save
      end
      redirect_to article_path(id: @article.id)
      flash.notice = 'Article saved'
    else
      render :new
      flash.notice = 'Error article not saved'
    end
  end

  def show
    @article = Article.last_art(params[:id])
  end

  def search
    @articles = Article.search(params[:search]).paginate(page: params[:page], per_page: 5)
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :image)
  end
end
