class CartController < ApplicationController
  before_action :set_cart, only: [:add_to_cart]

  def show
    @cart = Cart.find(cookies[:cart_id]) if cookies[:cart_id]
  end

  def add_to_cart
    @cart_product = CartProduct.new(cart_product_params)
    @cart_product.cart = @cart

    @cart_product.save

    respond_to do |format|
      format.js
    end
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:product_id, :quantity, :product_size_id)
  end

  def set_cart
    @cart = if cookies[:cart_id]
              Cart.find(cookies[:cart_id])
            else
              cart = Cart.create
              cookies[:cart_id] = cart.id

              cart
            end
  end
end
