class Admin::CommentsController < ApplicationController
 
 def index
  @comments = Comment.page(params[:page]).per(10)
 end

 def show
  @comment = Comment.find(params[:id])
 end

 def update
  @comment = Comment.find(params[:id])
  if @comment.update(comment_params)
   redirect_to admin_comments_path
   flash[:notice] = "ステータスを更新しました。"
  else
   render :index
  end
 end

 private
 def comment_params
  params.require(:comment).permit(:is_active)
 end
 
end
