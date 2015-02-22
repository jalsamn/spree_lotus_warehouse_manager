class AddRevelIdToSpreeVarients < ActiveRecord::Migration
  def change
    add_column :spree_variants, :revel_id, :bigint
  end
end
