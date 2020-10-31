class Admin::CartsController < Admin::BaseController
  def index
    @carts = Cart.order(created_at: :desc)
  end

  def show
    @cart = Cart.find(params[:id])
  end
end
