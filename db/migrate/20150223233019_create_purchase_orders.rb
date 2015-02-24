class CreatePurchaseOrders < ActiveRecord::Migration
  def change
    create_table :spree_purchase_orders do |t|
      t.integer :vendor_id
      t.boolean :received
      t.boolean :active

      t.timestamps
    end
  end
end
