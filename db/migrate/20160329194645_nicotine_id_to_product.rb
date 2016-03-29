class NicotineIdToProduct < ActiveRecord::Migration
  def change
    add_column :products , :nicotine_id, :integer
  end
end
