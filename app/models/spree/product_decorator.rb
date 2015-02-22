module Spree
  Product.class_eval do
    delegate_belongs_to :master, :expireable, :pestissue, :multiplebarcode, :barcode, :vendor_id, :revel_id
  end
end