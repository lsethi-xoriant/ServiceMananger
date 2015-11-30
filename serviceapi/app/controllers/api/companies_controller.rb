class Api::CompaniesController < ApplicationController
  respond_to :json
  load_and_authorize_resource
  def index
    @companies = Company.accessible_by(current_ability)
   # respond_with @companies,status: 200
    render json: I18n.locale
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



  private

  def company_params
    params.require(:company).permit(:email,:name,:city,:country,:user_id)
  end


end
