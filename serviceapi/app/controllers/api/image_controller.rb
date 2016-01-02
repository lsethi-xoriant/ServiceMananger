class Api::ImageController < ApplicationController

  def create

  end



  private

  def image_params
    params.require(:image).permit(:name)
  end
end
