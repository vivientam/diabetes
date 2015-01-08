class ArticlesController < ApplicationController

  def index
    @arcitles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end 
  
  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

end
