class CartProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  belongs_to :product_size

  after_commit :recalculate_cart_total_price

  def product_name
    product.name
  end

  def size_name
    product_size.name
  end

  def price
    product.price
  end

  def subtotal
    price * quantity
  end

  private

  def recalculate_cart_total_price
    cart.recalculate_total_price
  end
end
