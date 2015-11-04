class Api::StoresController < ApplicationController
  # authorize_resource
  def index
    @stores = Store.all
    render json: @stores
  end

  def create
    @store = Store.create(store_params)
    if @store.save
      render json: @store,status: 201
    else
      render json: @store.errors,status: :unprocessable_entity
    end
  end

  def show
    @store = Store.find(params[:id])
    render json: @store
  end

  def update
    @store = Store.find(params[:id])
    if @store.update_attributes(store_params)
      render json: @store,status: 200
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
    params.require(:store).permit(:email,:name,:city,:country)
  end


end
