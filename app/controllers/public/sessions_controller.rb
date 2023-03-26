# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  layout 'header_public'
  before_action :customer_state, only: [:create]
  before_action :configure_sign_in_params, only: [:sign_in]
  before_action :authenticate_customer!, except: [:sign_in]

  def after_sign_in_path_for(resource)
    root_path
  end
  # GET /resource/sign_in
  # def new
  # end

  # # POST /resource/sign_in
  # def create
  #   redirect_to root_path, success: 'ログインに成功しました'
  # end

  # # DELETE /resource/sign_out
  # def destroy
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  # end

  protected

  def customer_state
    @customer = Customer.find_by(email: params[:customer][:email])
    if @customer
     if (@customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == true))
       flash[:alert] = "退会済みです。再登録の上ご利用ください"
       redirect_to new_customer_session_path
     else
       flash[:notice] = "入力してください。"
     end
    end
  end

end

