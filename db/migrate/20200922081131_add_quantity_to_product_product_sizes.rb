class AddQuantityToProductProductSizes < ActiveRecord::Migration[6.0]
  def change
    add_column :product_product_sizes, :quantity, :integer
  end
end
