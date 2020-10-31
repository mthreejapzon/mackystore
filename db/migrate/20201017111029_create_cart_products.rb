class CreateCartProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_products do |t|
      t.belongs_to :cart
      t.belongs_to :product
      t.integer :quantity
      t.belongs_to :product_size

      t.timestamps
    end
  end
end
