class AddProductVarientsToSpreeVariants < ActiveRecord::Migration
  def change
    add_column :spree_variants, :expireable, :boolean
    add_column :spree_variants, :pestissue, :boolean
    add_column :spree_variants, :multiplebarcode, :boolean
  end
end
