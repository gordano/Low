class NicotineIdToProduct < ActiveRecord::Migration
  def change
    add_column :products , :niconite_id, :integer
  end
end
