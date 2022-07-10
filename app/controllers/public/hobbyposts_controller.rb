class Public::HobbypostsController < ApplicationController

 before_action :authenticate_member!

 def new
  @hobbypost = Hobbypost.new
 end

 def index
  @q = Hobbypost.ransack(params[:q])
  @hobbyposts = @q.result.includes(:member, :genre).order(created_at: :desc)
  @genres = Genre.all
   if params[:genre_id].present?
   genre = Genre.find(params[:genre_id])
   @hobbyposts = genre.hobbyposts.where(is_active: :on, status: :true).order(params[:sort]).page(params[:page]).per(10)
    unless @hobbyposts.present?
     redirect_to hobbyposts_path
    end
   else
    @hobbyposts = Hobbypost.where(is_active: :on, status: :true).order(params[:sort]).page(params[:page]).per(10)
   end
 end

 def create
  @hobbypost = Hobbypost.new(hobbypost_params)
  if params[:post]
   if @hobbypost.save!(status: true)
    redirect_to hobbyposts_path
    flash[:notice] = "投稿しました。"
   else
    render :new
    flash[:alert] = "投稿できませんでした。入力内容をご確認ください。"
   end
  else
   if @hobbypost.save(status: false)
    redirect_to member_path(current_member)
    flash[:notice] = "下書き保存しました。"
   else
    render :new
    flash[:alert] = "保存できませんでした。入力内容をご確認ください。"
   end
  end
 end

 def show
  @hobbypost = Hobbypost.find(params[:id])
  @is_active = @hobbypost.comments.where(is_active: :on)
  @comment = Comment.new
  @favorite_count = Favorite.where(hobbypost_id: @hobbypost).count
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
  params.require(:hobbypost).permit(:genre_id, :member_id, :title, :introduction, :status)
 end

end
