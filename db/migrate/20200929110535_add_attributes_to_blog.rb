class AddAttributesToBlog < ActiveRecord::Migration[6.0]
  def change
    add_column :blogs, :slug, :string
    add_column :blogs, :author, :string
    add_column :blogs, :image, :string
  end
end
