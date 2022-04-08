class CommentsController < ApplicationController

  def create
    puts "Reached"
    @comment = @commentable.comments.new comment_params
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = "Comment was successfully created."
      redirect_to @commentable
    else 
      flash[:notice] = "Something went wrong."
    end
  end
  
  private

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end
end
