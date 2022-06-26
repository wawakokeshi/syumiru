class Public::HobbyPostsController < ApplicationController

 def new
  @hobby_post = HobbyPost.new
 end

 def index
  @hobby_posts = HobbyPost.page(params[:page])
 end

 def create
  @hobby_post = HobbyPost.new(hobby_post_params)
  if @hobby_post.save!
   redirect_to hobby_posts_path
   flash[:notice] = "投稿が完了しました。"
  else
   render :new
  end
 end

 def show
  @hobby_post = HobbyPost.find(params[:id])
 end
 
 def edit
  @hobby_post = HobbyPost.find(params[:id])
 end
 
 def update
  @hobby_post = HobbyPost.find(params[:id])
  if @hobby_post.update(hobby_post_params)
   redirect_to hobby_posts_path
   flash[:notice] = "投稿内容を更新しました。"
  else
   render :edit
  end
 end

 def destroy
  hobby_post = HobbyPost.find(params[:id])
  hobby_post.delete
  flash[:notice] = "投稿を削除しました。"
  redirect_to hobby_posts_path
 end

 private
 def hobby_post_params
  params.require(:hobby_post).permit(:genre_id, :member_id, :title, :introduction)
 end

end
