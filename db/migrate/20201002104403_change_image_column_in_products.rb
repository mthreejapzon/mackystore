class ChangeImageColumnInProducts < ActiveRecord::Migration[6.0]
  def up
    remove_column :products, :image
    add_column :products, :images, :string, array: true, default: '{}'
  end

  def down
    add_column :products, :image, :string
    remove_column :products, :images
  end
end
