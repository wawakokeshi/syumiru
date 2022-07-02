class Admin::HobbypostsController < ApplicationController
 def index
  @hobbyposts = Hobbypost.where(status: :true).order(params[:sort]).page(params[:page]).per(10)
 end

 def show
  @hobbypost = Hobbypost.find(params[:id])
 end

 def update
  @hobbypost = Hobbypost.find(params[:id])
  if @hobbypost.update(hobbypost_params)
   redirect_to admin_hobbyposts_path
   flash[:notice] = "投稿内容を更新しました。"
  else
   render :index
  end
 end

 private
 def hobbypost_params
  params.require(:hobbypost).permit(:is_active)
 end

end

