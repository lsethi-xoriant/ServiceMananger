class Api::CompaniesController < ApplicationController
  respond_to :json

  load_and_authorize_resource except: :validation_name
  skip_authorization_check :only => [:validation_name]
  skip_before_action :restrict_access,:set_locale ,only: :validation_name

  def index
    @companies = Company.accessible_by(current_ability)
    respond_with @companies,status: 200
  end

  def create
    @company = Company.create(company_params)
    @company.users << current_user
    if @company.save
      respond_with @company,status: 201
    else
      render json: @company.errors,status: :unprocessable_entity
    end
  end

  def show
    @company = Company.find(params[:id])
    respond_with @company,status: 200
  end

  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(company_params)
      respond_with @company,status: 200
    else
      render json: @company.errors,status: :unprocessable_entity
    end
  end

  def destroy
    @company = Company.find(params[:id])
    if @company.destroy
      render nothing:true,status: 200
    else
      render json: @company.errors
    end
  end

  # Check if company exist with name
  # Response: true if valid, false if invalid
  def validation_name
    @company = Company.where(:name => params[:name]).first

    if @company
      render json: false
    else
      render json: true
    end
  end


  private

  def company_params
    params.require(:company).permit(:email,:name,:city,:country,:user_id,:address,:logoImageLink)
  end

end
