class ArticlesController < ApplicationController
  before_action :current_user
  before_action :create_categories
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
    if @article.save
      tag_ids.each do |t|
        @cat = Categorie.find(t)
        @ac = Tag.create
        @ac.article_id = @article.id
        @ac.category_id = @cat.id
        @ac.save
      end
      redirect_to articles_path
      flash.notice = "Article saved"
    else
      render :new
      flash.notice = "Error article not saved"
    end

  end

  def show
    @cat = list(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :image)
  end

  def categ
    Categorie.first.articles.last
  end

  def list(id)
    Categorie.find(id).articles.order(created_at: :desc).includes(:author)
  end
end
