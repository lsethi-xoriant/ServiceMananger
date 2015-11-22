class Api::AccountPackagesController < ApplicationController
  skip_authorization_check
  def index
    @account_packages = AccountPackage.all
    render json: @account_packages,status:200
  end
end
