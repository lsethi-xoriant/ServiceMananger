class Api::GroupsController < ApplicationController
  load_and_authorize_resource
  def index
    groups = current_user.companies.includes(:groups).map do |company|
      company.groups
    end
    @groups = groups.uniq
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
    params.require(:group).permit(:name,:description,:active,store_ids:[])
  end
end
