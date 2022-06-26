class Public::PostsController < ApplicationController
  
 def new
  @post = Post.new
 end
 
 def index
  @posts = Post.page(params[:page])
 end

 def create
  @post = Post.new(post_params)
  if @post.save
   redirect_to posts_path
   flash[:notice] = "投稿が完了しました。"
  else
   render :new
  end
 end

 def show
  @post = Post.find(params[:id])
 end

 def update
  @post = Post.find(params[:id])
  if @post.update(post_params)
   redirect_to posts_path
   flash[:notice] = "投稿内容を更新しました。"
  else
   render :edit
  end
 end
 
 def destroy
  postdes = Post.find(params[:id])
  postdes.delete
  flash[:notice] = "投稿を削除しました。"
  redirect_to posts_path
 end
 
 private
 def post_params
  params.require(:post).permit(:genre_id, :member_id, :title, :introduction)
 end
  
end
