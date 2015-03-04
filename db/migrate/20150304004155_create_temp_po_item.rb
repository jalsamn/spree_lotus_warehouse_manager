class CreateTempPoItem < ActiveRecord::Migration
  def change
    create_table :spree_temp_po_items do |t|
      t.integer :po_id
      t.integer :variant_id
    end
  end
end
