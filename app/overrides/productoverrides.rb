Deface::Override.new(:virtual_path => 'spree/admin/products/_form',
  :name => 'cadminorderedit',
  :replace => "[data-hook='admin_product_form_sku']",
  :partial => "spree/admin/cadminproductaddition")
