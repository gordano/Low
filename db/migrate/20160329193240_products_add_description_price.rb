class ProductsAddDescriptionPrice < ActiveRecord::Migration
  def change
    add_column :products ,:description, :text
    add_column :products ,:price, :float
    add_index(:products,:title)
  end
end
