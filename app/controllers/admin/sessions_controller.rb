# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  layout 'header_admin'

  # before_action :configure_sign_in_params, only: [:create]
  before_action :authenticate_admin!

  def after_sign_in_path_for(resource)
    admin_path
  end

  # GET /resource/sign_in
  # def new
  # end

  # POST /resource/sign_in
  # def create
  #   # admin = Admin.find_by(email: params[:session][:email])
  # #   if admin && admin.authenticate(params[:session][:password])
  # #     log_in admin
  #     redirect_to admin_path, success: 'ログインに成功しました'
  # #     flash[:notice] = 'ログインに成功しました'
  # #   else
  # #     flash.now[:danger] = 'ログインに失敗しました'
  # #     render :new
  # #   end
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   log_out
  #   redirect_to new_admin_session_path
  #   flash[:notice] = "ログアウトしました"
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  # end

  # private

  # def log_in(admin)
  #   session[:admin_id] = admin.id
  # end

  # def log_out
  #   session.delete(:admin_id)
  #   @current_admin = nil
  # end

end
