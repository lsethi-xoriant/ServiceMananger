class Api::RegistrationController < ApplicationController
  skip_authorization_check
  skip_before_action :restrict_access


  def create
      @user = User.new(registration_account_params)
      @user.validation_trigger = false
      @user.auth_token= generate_new_token
      if @user.save
        render json: @user,status: 200
      else
        render json: @user.errors,status: :unprocessable_entity
      end
    end


  private

  def registration_account_params
    params.require(:registration).permit(:email,:username,:password,:password_confirmation,:account_package_id)
  end

  def generate_new_token
    SecureRandom.uuid.gsub(/\-/,'')
  end

end
