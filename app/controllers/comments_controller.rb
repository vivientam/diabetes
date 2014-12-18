class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @myComment = current_user.comments.new(comment_params)
    
    if @myComment.save
      
        respond_to do |format|
          
          format.js
          
        end
      
    else
      respond_to do |format|
          format.js { render 'fail.js.erb' }
          format.html {redirect_to :back}
      end
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end 
  
  private

  def comment_params
    params.require(:comment).permit(:post_id, :content)
  end

end
