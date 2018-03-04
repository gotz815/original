class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show

    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit 
  end

  # POST /articles
  # POST /articles.json
  def create
    Article.create(title: article_params[:title], text: article_params[:text], user_id: current_user.id)
    redirect_to controller: :articles, action: :index
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    article = Article.find(params[:id])
    article.update(article_params)
    redirect_to action: :index
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
