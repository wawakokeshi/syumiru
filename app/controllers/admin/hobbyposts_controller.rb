class Admin::HobbypostsController < ApplicationController
 def index
  @hobbyposts = Hobbypost.where(status: :true).order(params[:sort]).page(params[:page]).per(10)
 end

 def create
  @hobbypost = Hobbypost.new(hobbypost_params)
   if @hobbypost.save!(status: true)
    redirect_to admin_hobbyposts_path
    flash[:notice] = "投稿しました。"
   else
    render :new
    flash[:alert] = "投稿できませんでした。入力内容をご確認ください。"
   end
 end

 def show
  @hobbypost = Hobbypost.find(params[:id])
 end

 def edit
  @hobbypost = Hobbypost.find(params[:id])
 end

 def update
  @hobbypost = Hobbypost.find(params[:id])
  if @hobbypost.update(hobbypost_params)
   redirect_to admin_hobbyposts_path
   flash[:notice] = "投稿内容を更新しました。"
  else
   render :edit
  end
 end

 private
 def hobbypost_params
  params.require(:hobbypost).permit(:genre_id, :member_id, :title, :introduction, :status)
 end

end

