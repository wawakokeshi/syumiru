class Public::HobbypostsController < ApplicationController

 def new
  @hobbypost = Hobbypost.new
 end

 def index
  @hobbyposts = Hobbypost.page(params[:page])
 end

 def create
  @hobbypost = Hobbypost.new(hobbypost_params)
  if @hobbypost.save!
   redirect_to hobbyposts_path
   flash[:notice] = "投稿が完了しました。"
  else
   render :new
  end
 end

 def show
  @hobbypost = Hobbypost.find(params[:id])
  @comment = Comment.new
  @comments = Comment
 end
 
 def edit
  @hobbypost = Hobbypost.find(params[:id])
 end
 
 def update
  @hobbypost = Hobbypost.find(params[:id])
  if @hobbypost.update(hobbypost_params)
   redirect_to hobbyposts_path
   flash[:notice] = "投稿内容を更新しました。"
  else
   render :edit
  end
 end

 def destroy
  hobbypost = Hobbypost.find(params[:id])
  hobbypost.delete
  flash[:notice] = "投稿を削除しました。"
  redirect_to hobbyposts_path
 end

 private
 def hobbypost_params
  params.require(:hobbypost).permit(:genre_id, :member_id, :title, :introduction)
 end

end
