class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :fio
      t.string :email
      t.string :phone
      t.text :comment
      t.float :totalPrice

      t.timestamps null: false
    end
  end
end
