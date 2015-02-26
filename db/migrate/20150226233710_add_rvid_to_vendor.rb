class AddRvidToVendor < ActiveRecord::Migration
  def change
    add_column :spree_vendors, :rvid, :integer
  end
end
