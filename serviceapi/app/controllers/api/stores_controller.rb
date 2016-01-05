class Api::StoresController < ApplicationController
  respond_to :json

  load_and_authorize_resource
  before_filter :check_company_id ,:only=> :update

  def index
    @stores = Store.accessible_by(current_ability)
    respond_with @stores,status: 200
  end

  def create
    @store = Store.create(store_params)
    @store.users << current_user
    if @store.save
      respond_with @store,status: 201
    else
      render json: @store.errors,status: :unprocessable_entity
    end
  end

  def show
    @store = Store.find(params[:id])
   respond_with @store,status: 200
  end

  def update
    @store = Store.find(params[:id])
    if @store.update_attributes(store_params)
      respond_with @store,status: 200
    else
      render json: @store.errors,status: 404
    end
  end


  def destroy
    @store = Store.find(params[:id])
    if @store.destroy
      render nothing:true,status: 200
    else
      render json: @store.errors
    end
  end



  private

  def store_params
    params.require(:store).permit(:email,:name,:city,:country,:company_id,:logoImageLink,:address)
  end


  def check_company_id
    if params[:store][:company_id].present?
      if !current_user.companies.pluck(:id).include? params[:store][:company_id]
        render json:{message: "You do not own a company with id #{params[:store][:company_id]}"},status: 403
      end
    end
  end

end
