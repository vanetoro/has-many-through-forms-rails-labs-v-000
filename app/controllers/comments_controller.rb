class CommentsController < ApplicationController

  def create
    binding.pry
    if !comment_params[:user_attributes][:username].empty?
      comment = Comment.create(comment_params)
    end
    binding.pry
    redirect_to comment.post
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
