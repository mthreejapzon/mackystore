class Cart < ApplicationRecord
  has_many :cart_products
  has_many :products, through: :cart_products

  def recalculate_total_price
    total_price = cart_products.map(&:subtotal).sum

    self.update_column(:total_price, total_price)
  end
end
