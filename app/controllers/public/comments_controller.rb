class Public::CommentsController < ApplicationController

  before_action :authenticate_member!

  def create
   @comment = Comment.new(comment_params)
   @comment.save
   redirect_to hobbyposts_path
  end

  def show
  end

 private

 def comment_params
  params.require(:comment).permit(:hobbypost_id, :member_id, :content)
 end

end
