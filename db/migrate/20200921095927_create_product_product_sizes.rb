class CreateProductProductSizes < ActiveRecord::Migration[6.0]
  def change
    create_table :product_product_sizes do |t|
      t.integer :product_id
      t.integer :product_size_id

      t.timestamps
    end
  end
end
