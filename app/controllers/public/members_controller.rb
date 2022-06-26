class Public::MembersController < ApplicationController
  
  before_action :correct_member, only: [:edit, :update, :withdrawal]
  
  def show
   @member = current_member
  end

  def edit
   @member = current_member
  end

  def update
  @member = current_member
   if @member.update(member_params)
    flash[:notice] = "会員情報を更新しました。"
    redirect_to member_path(@member.id)
   else
    flash[:alert] = "情報を正しく入力してください。"
    @member = current_member
    render :edit
   end
  end
  
  def unsubscribe
   @member = current_member
  end
  
  def withdrawal
   @member = current_member
   @member.update(is_active: false)
   reset_session
   flash[:notice] = "退会処理を実行しました。"
   redirect_to root_path
  end
  
  private
  def member_params
    params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :gender, :age, :telephone_number, :email, :is_active, :nickname, :image)
  end

  def correct_member
   @member = current_member
   redirect_to(member_path(current_member.id)) unless @member == current_member
  end
  
end
