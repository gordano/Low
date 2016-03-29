class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :title
      t.text :about
      t.string :email
      t.string :phone

      t.timestamps null: false
    end
  end
end
