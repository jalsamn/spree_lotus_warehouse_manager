class AddVendorIdToProduct < ActiveRecord::Migration
  def change
    add_column :spree_variants, :vendor_id, :integer
  end
end
