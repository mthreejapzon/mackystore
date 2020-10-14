class ProductsController < ApplicationController
  def index
    @products = Product.all.order(:name)
  end

  def show
    @product = Product.find(params[:id])
    initial_size = @product.product_sizes.first
    @initial_quantity = initial_size.product_product_sizes.find_by(product_id: params[:id]).quantity
  end

  def fetch_quantity
    product_id = Product.find(params[:id]).id
    product_size_id = ProductSize.find(params[:product_size_id]).id

    render json: { quantity: ProductProductSize.where(product_id: product_id, product_size_id: product_size_id).first.quantity }
  end
end
