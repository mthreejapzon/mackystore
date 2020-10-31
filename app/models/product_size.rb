class ProductSize < ApplicationRecord
  has_many :product_product_sizes
  has_many :products, through: :product_product_sizes
  has_many :cart_products
end
