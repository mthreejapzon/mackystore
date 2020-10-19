class CartController < ApplicationController
  def index
    @carts = Product.all

    respond_to do |format|
      format.js
    end
  end
end
