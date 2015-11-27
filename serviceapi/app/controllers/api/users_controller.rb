class Api::UsersController < ApplicationController
  include ReusableMethods
  respond_to :json

  load_and_authorize_resource
  before_filter :check_params,only:[:create,:update]


  def index
    @users = User.accessible_by(current_ability)
    respond_with @users,status: 200
  end

  def create
    @user = User.new(user_params)
    @user.validation_trigger = true
    if @user.save
      respond_with @user,status: 201
    else
      respond_with @user.errors,status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    respond_with @user,status:200
  end

  def update
    @user = User.find(params[:id])
    @user.validation_trigger = true
    if @user.update_attributes(user_params)
      respond_with @user,status: 200
    else
     render json: @user.errors,status: :unprocessable_entity
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
    params.require(:user).permit(:email,:username,:password,:password_confirmation,company_ids:[],group_ids:[])
  end



  def check_params
    checking_ids(current_user.companies.pluck(:id),params[:user][:company_ids]) if params[:user][:company_ids].present?
    check_group_ids(params[:user][:group_ids]) if params[:user][:group_ids].present?
    check_store_ids(params[:user][:store_ids]) if params[:user][:store_ids].present?
  end


end
