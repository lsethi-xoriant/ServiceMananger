class Api::CompaniesController < ApplicationController
  load_and_authorize_resource
  def index
    @companies = Company.accessible_by(current_ability)
    render json: @companies
  end

  def create
    @company = Company.create(company_params)
    @company.users << current_user
    if @company.save
      render json: @company,status: 201
    else
      render json: @company.errors,status: :unprocessable_entity
    end
  end

  def show
    @company = Company.find(params[:id])
    render json: @company
  end

  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(company_params)
      render json: @company,status: 200
    else
      render json: @company.errors,status: 404
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



  private

  def company_params
    params.require(:company).permit(:email,:name,:city,:country,:user_id)
  end


end
