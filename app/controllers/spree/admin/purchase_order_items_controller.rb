module Spree
  module Admin

    class PurchaseOrderItemsController < Spree::Admin::BaseController
  before_action :set_purchase_order, only: [:show, :edit, :update, :destroy]
 
  def create
    @purchase_order_item = Spree::PurchaseOrderItem.new(purchase_order_item_params)
    if @purchase_order_item.save
      redirect_to admin_listproducts_url, notice: 'Purchase Order was successfully created.'
    else
      render :new
    end
  end
      

      
    # Only allow a trusted parameter "white list" through.
  def purchase_order_item_params
    params.require(:purchase_order_item).permit(:purchase_order_id, :product_id, :quantity, :quantitytype)
    end
end
  end
end

