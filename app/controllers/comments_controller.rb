class CommentsController < ApplicationController

  def create
    @comment = Comment.new(get_comment)
    @comment.user = current_user
    if @comment.save
      redirect_to product_path(@comment.product_id)
    else
      redirect_to product_path(@comment.product_id), flash: { error: @comment.errors.full_messages }
    end
  end

  private

  def get_comment
    params.require(:comment).permit(:comment,:product_id)
  end
end
