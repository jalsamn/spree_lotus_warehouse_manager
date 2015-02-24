class Spree::PurchaseOrderItem < ActiveRecord::Base
  belongs_to :purchase_order, class_name: 'Spree::PurchaseOrder'
  
 
end
