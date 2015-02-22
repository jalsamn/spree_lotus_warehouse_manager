class AddRevelIdToProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :revel_id, :integer
  end
end
