# frozen_string_literal: true

class Public::RegistrationsController < Devise::RegistrationsController
  layout 'header_public'

  before_action :configure_sign_up_params, except: [:sign_up]
  # before_action :configure_account_update_params, only: [:update]
  before_action :authenticate_customer!, except: [:sign_up]

  def after_sign_up_path_for(resource)
    customer_path(current_customer)
  end


  # GET /resource/sign_up
  # def new
  # end

  # POST /resource
  # def create
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: [
        :email,
        :password,
        :last_name,
        :first_name,
        :last_name_kana,
        :first_name_kana,
        :postal_code,
        :address,
        :telephone_number
        ])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
