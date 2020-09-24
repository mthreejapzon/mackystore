class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  mount_uploader :image, ImageUploader

  belongs_to :product_type
  has_many :product_product_sizes
  has_many :product_sizes, through: :product_product_sizes
end
