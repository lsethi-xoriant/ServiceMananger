class Api::AccessController < ApplicationController
  respond_to :json

  skip_authorization_check :only => [:create,:logout]

  skip_before_action :restrict_access,:set_locale ,only: :create


  def create
    @user = User.where(:username=>params[:access][:username]).first
    I18n.locale = @user.language if @user.present?
    if @user && @user.authenticate(params[:access][:password])
      token = generate_new_token
      @user.update_attributes(:auth_token => token)
      respond_with @user,status: 200
    else
      render json: {message:t(:accessMessage)},status: 401
    end
  end

  def logout
    if current_user && current_user.update_column(:auth_token,nil)
      render json:{message:t(:logoutMessage)},status: :ok
    else
      render json: {error:user.errors},status: 404
    end
  end

  private

  def generate_new_token
    SecureRandom.uuid.gsub(/\-/,'')
  end

end
