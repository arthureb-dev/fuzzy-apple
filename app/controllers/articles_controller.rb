class ArticlesController < ApplicationController
  def index
    render json: ArticleBlueprint.render(Article.latest), status: :ok
  end

  def create
    article = Article.new(article_params)

    if article.save
      render json: ArticleBlueprint.render(article), status: :created
    else
      render json: article.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    article = Article.find(params[:id]) rescue nil

    return render json: "Not Found", status: :not_found unless article

    render json: ArticleBlueprint.render(article), status: :ok
  end

  def update
    head :method_not_allowed
  end

  def destroy
    head :method_not_allowed
  end

  private

  def article_params
    params.permit(:title, :content, :author, :category, :published_at)
  end
end
