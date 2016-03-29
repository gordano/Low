class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :product_count
      t.integer :nicotine_id

      t.timestamps null: false
    end
  end
end
