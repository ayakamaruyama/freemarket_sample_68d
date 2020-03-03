class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  # def new
  #   @comment = Comment.new

  # end

  def create
    comment = Comment.create(comment_params)
    redirect_to item_path(comment.item_id)
    # @comment = Comment.create(comment_params)
    # respond_to do |format|
    #   format.html { redirect_to tweet_path(params[:tweet_id])  }
    #   format.json
    # end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id,item_id: params[:item_id])
  end
end