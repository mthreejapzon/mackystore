class AddImageToProductTypes < ActiveRecord::Migration[6.0]
  def change
    add_column :product_types, :image, :string
  end
end
