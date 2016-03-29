class CreateNicotines < ActiveRecord::Migration
  def change
    create_table :nicotines do |t|
      t.float :count
      t.timestamps null: false
    end
  end
end
