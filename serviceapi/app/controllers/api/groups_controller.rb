class Api::GroupsController < ApplicationController
  load_and_authorize_resource
  before_action ->{checking_ids(params[:group][:store_ids])},only: [:update]
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


  def checking_ids(arrParam)
    isExist=false
    arrParam.each do |v|
      isExist=false
      current_user.stores.pluck(:id).each do |base|
        if v == base
          isExist = true
          break
        end
      end

      if !isExist
        raise CanCan::AccessDenied.new("One of the Stores Ids is not yours")
      end
    end
    return isExist
  end
end
