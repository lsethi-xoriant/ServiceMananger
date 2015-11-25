class Api::RegistrationController < ApplicationController
  skip_authorization_check
  skip_before_action :restrict_access
  def create
      @user = User.create(registration_account_params)
      if @user.save
        render json: @user,status: 200
      else
        render json: @user.errors,status: :unprocessable_entity
      end
    end


  def registration_account_params
    params.require(:registration).permit(:email,:username,:password,:password_confirmation,:account_package_id)
  end

end
