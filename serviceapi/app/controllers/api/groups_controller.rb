class Api::GroupsController < ApplicationController
  include ReusableMethods

  load_and_authorize_resource

  before_action :check_param,only: [:update,:create]

  def index
    @groups = Group.accessible_by(current_ability)
    # @groups = groups.uniq
    render json: @groups,status: :ok
  end

  def show
    @group = Group.find(params[:id])
    render json: @group , status: :ok
  end

  def create
    @group = Group.create(group_params)
    if @group.save
      render json: @group,status: 201
    else
      render json: @group.errors,status: :unprocessable_entity
    end
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(group_params)
      render json: @group,status: 200
    else
      render json: @group.errors,status: 404
    end
  end

  def destroy
    @group = Group.find(params[:id])
    if @group.destroy
      render nothing:true,status: 200
    else
      render json: @group.errors
    end
  end



  private

  def group_params
    params.require(:group).permit(:name,:description,:active,store_ids:[],permission_ids:[])
  end

  def check_param
    if params[:group][:store_ids].present?
      checking_ids(current_user.stores.pluck(:id),params[:group][:store_ids])
    end
    if params[:group][:permission_ids].present?
      check_permissions(params[:group][:permission_ids])
    end

  end
end
