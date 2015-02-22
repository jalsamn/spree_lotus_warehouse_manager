class AddBarcodeToSpreeVarients < ActiveRecord::Migration
  def change
    add_column :spree_variants, :barcode, :bigint
  end
end
