class Spree::PurchaseOrder < ActiveRecord::Base
  has_many :purchase_order_items, class_name: 'Spree::PurchaseOrderItem'
  
   def purchase_order_items_attr=(purchase_order_items_attr)
    purchase_order_items_attr.each do |attributes|
        purchase_order_items_attr.build(attributes)
      end
  end
end
