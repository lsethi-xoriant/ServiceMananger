class Api::UsersController < ApplicationController
  include ReusableMethods

  before_filter :check_params,only:[:create]
  load_and_authorize_resource

  def index
    @users = User.accessible_by(current_ability)
    render json: @users,:except=>[:password_digest],:include=>[:groups=>{:only=>:name}]
  end

  def create
    @user = User.create(user_params)
    if @user.save
      render json: @user,status: 201
    else
      render json: @user.errors,status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    render json: @user,:except=>[:password_digest],:include=>[:groups=>{:only=>[:name,:id]}]
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      render json: @user,status: 200
    else
      render json: @user.errors,status: 404
    end
  end


  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      render nothing:true,status: 200
    else
      render json: @user.errors
    end
  end



private

def user_params
  params.require(:user).permit(:email,:username,:password,:password_confirmation,company_ids:[])
end

def check_params
  if params[:user][:company_ids].present?
    checking_ids(current_user.companies.pluck(:id),params[:user][:company_ids])
  end
end

end
