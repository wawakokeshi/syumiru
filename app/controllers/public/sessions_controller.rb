# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_member, only: [:create]
  skip_before_action :verify_authenticity_token

  def after_sign_in_path_for(resource)
    about_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def member_state
   @member = Member.find_by(email: params[:member][:email])
   return if !@member
   if @member.valid_password?(params[:member][:password]) && (@customer.is_active == "stay")
   redirect_to member_path(current_member.id)
   else
   render new_member_registration_path
   end
  end

  def reject_member
   @member = Member.find_by(email: params[:member][:email])
    if @member
      if @member.valid_password?(params[:member][:password]) && (@member.is_active == "withdrawal")
        flash[:alert] = "退会済みです。"
        redirect_to new_member_session_path
      end
    else
      flash[:alert] = "必須項目を入力してください。"
    end
  end


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
