class CreateTempPos < ActiveRecord::Migration
  def change
    create_table :spree_temp_pos do |t|
      t.integer :po_id
      t.integer :var_id

      t.timestamps
    end
  end
end
