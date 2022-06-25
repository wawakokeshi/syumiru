class Admin::MembersController < ApplicationController

 def index
  @members = Member.page(params[:page])
 end

 def show
  @member = Member.find(params[:id])
 end

 def edit
  @member = Member.find(params[:id])
 end

 def update
  @member = Member.find(params[:id])
  @member.update(member_params)
  # if @customer.update(customer_params)
  # flash[:success] = "更新しました"
  redirect_to admin_member_path(@member.id)
  #else
   #render :edit
  #end
 end

private
  def member_params
    params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :gender, :age, :telephone_number, :email, :is_active, :nickname)
  end

end
