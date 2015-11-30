class Api::AccessController < ApplicationController
  respond_to :json
  skip_authorization_check :only => [:create]

  skip_before_action :restrict_access ,only: :create
  skip_before_action :set_locale ,only: :create

  def create
    @user = User.where(:username=>params[:access][:username]).first
    if @user && @user.authenticate(params[:access][:password])
      token = generate_new_token
      @user.update_attributes(:auth_token => token)
      # render json: @user,:except=>[:password_digest],status: 200
      respond_with @user,status: 200
    else
      render json:{message:"Bad Credentials"},status:401
    end
  end

  def destroy
    user = User.find(params[:id])
    if user && user.update_column(:auth_token,nil)
      render json:{message:"Successfully Logout"},status: :ok
    else
      render json: {error:user.errors},status: 404
    end
  end

  private

  def generate_new_token
    SecureRandom.uuid.gsub(/\-/,'')
  end

end
