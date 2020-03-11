class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @comment = Comment.new
    @comments = @items.comments.includes(:user)


  end

  # def new
  #   @comment = Comment.new
  #   @comments = @items.comments.includes(:user)

  # end


  def create
    comment = Comment.create(comment_params)
    redirect_to item_path(comment.item_id)
    # @comment = Comment.create(comment_params)
    # respond_to do |format|
    #   format.html { redirect_to item_path(params[:item_id])  }
    #   format.json
    # end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id,item_id: params[:item_id])
  end
end