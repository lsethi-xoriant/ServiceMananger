class Api::GroupsController < ApplicationController

  def index
    @groups = Group.all
    render json: @groups
  end

  def create
    @user = User.create(group_params)
    if @user.save
      render json: @user,status: 201
    else
      render json: @user.errors,status: :unprocessable_entity
    end
  end

  def update

  end

  def destroy

  end



  private

  def group_params
    params.require(:group).permit(:name,:description,:active)
  end
end
