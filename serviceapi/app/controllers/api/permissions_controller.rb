class Api::PermissionsController < ApplicationController
  load_and_authorize_resource
  def index
    @permissions = Permission.all
    render json: @permissions
  end

end
