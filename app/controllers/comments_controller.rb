class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @comments = current_user.comments
  end

  def new
    @comment = Comment.new
  end

  def create
    # comment = Comment.new(comment_params)
    comment = current_user.comments.new(comment_params)

    if comment.save
      redirect_to comment.reading
    else
      redirect_to :back
    end
  end

  def show
    @comment = Comment.find(params[:id])
    @reading = @comment.reading
  end 
  
  private

  def comment_params
    params.require(:comment).permit(:reading_id, :content)
  end

end
