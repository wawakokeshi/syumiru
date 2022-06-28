class Public::CommentsController < ApplicationController

  before_action :authenticate_member!

  def create
   @comment = Comment.new(comment_params)
   if @comment.save!
    redirect_to hobbyposts_path
    flash[:notice] = "コメントしました。"
   else
    render hobbypost_path(@hobbypost)
    flash[:notice] = "コメントに失敗しました。"
   end
  end

  def destroy
   @comment = Comment.find(params[:id])
   if @comment.destroy
     redirect_to hobbypost_path(@hobbypost), notice: 'コメントを削除しました'
   else
     flash.now[:alert] = 'コメント削除に失敗しました'
     render hobbypost_path(@hobbypost)
   end
  end

 private

 def comment_params
  params.require(:comment).permit(:hobbypost_id, :member_id, :content)
 end

end
