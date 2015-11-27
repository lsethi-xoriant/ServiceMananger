class Api::PermissionsController < ApplicationController
  respond_to :json

  load_and_authorize_resource

  def index
    @permissions = Permission.all
    respond_with @permissions,status: 200
  end

end
