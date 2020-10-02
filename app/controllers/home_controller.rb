class HomeController < ApplicationController
  def index
    @products = Product.all.order(:price)
  end

  def show
    @product = Product.find(params[:id])
  end
end
