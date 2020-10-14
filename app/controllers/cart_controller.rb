class CartController < ApplicationController
  def index
    cart = Product.first

    render json: { cart: cart }
  end
end
