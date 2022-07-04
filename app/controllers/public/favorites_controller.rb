class Public::FavoritesController < ApplicationController
 def create
  @favorite = Favorite.new(member_id: current_member.id, hobbypost_id: params[:hobbypost_id])
  @favorite.save!
 
  redirect_to hobbypost_path(params[:hobbypost_id])
 end

 def destroy
  @favorite = Favorite.find_by(member_id: current_member.id, hobbypost_id: params[:hobbypost_id])
  @favorite.destroy
  redirect_to hobbypost_path(params[:hobbypost_id])
 end
end
