class ShopController < ApplicationController
  def index
    @product_types = ProductType.all
  end

  def show
    @product_type = ProductType.find_by(name: params[:name])
  end
end
