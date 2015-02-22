class CreateSpreeVendors < ActiveRecord::Migration
  def change
    create_table :spree_vendors do |t|
      t.string :vendorname
      t.string :contactname
      t.string :email
      t.string :phone
      t.string :address1
      t.string :address2
      t.string :city
      t.string :country
      t.string :state
      t.integer :zip
      t.boolean :active

      t.timestamps
    end
  end
end
