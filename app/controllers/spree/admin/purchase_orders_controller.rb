module Spree
  module Admin

class PurchaseOrdersController < Spree::Admin::BaseController
  before_action :set_purchase_order, only: [:show, :edit, :update, :destroy]

  # GET /spree/vendors
  def index
    @purchase_orders = Spree::PurchaseOrder.all
  end

 
  
  # GET /spree/vendors/1
  def show
  end
  
  def listproducts
    @purchase_order = Spree::PurchaseOrder.find(params[:purchase_order_id])  
    @vars = Spree::Variant.all 
  end

  #Below code is too invoke view that will ask for which products to add to PO
  def add_individual_products
    @purchase_order = Spree::PurchaseOrder.find(params[:purchase_order_id])  
    @vars = Spree::Variant.find(params[:var_ids])  
  end
  
    #Below code is too invoke view that will ask for quantity for products to update to PO
  def update_individual_products
    @purchase_order = Spree::PurchaseOrder.find(params[:poid])  
      params[:purchase_order_item].each do |purchase_order_item|

        @poi = Spree::PurchaseOrderItem.new()
          purchase_order_item.each {|key, value| puts "#{key} is #{value}"

            if key == "purchase_order_id"
              @poi.purchase_order_id = value
            elsif key == "product_id"
              @poi.product_id = value
             elsif key == "quantity"
              @poi.quantity = value
             elsif key == "quantitytype"
              @poi.quantitytype = value
            end

             }
         @poi.save
       end
    redirect_to(:action => :display_detailed_purchase_order, :purchase_order_id=> @purchase_order.id, :notice => "Successfully updated feature.") and return
  end
  
  def display_detailed_purchase_order
      @purchase_order = Spree::PurchaseOrder.find(params[:purchase_order_id])  
      @purchase_order_items = @purchase_order.purchase_order_items
  end


  # GET /spree/vendors/new
  def new
    @purchase_order = Spree::PurchaseOrder.new
  end

  # GET /spree/vendors/1/edit
  def edit
  end

  # POST /spree/vendors
  def create
    @purchase_order = Spree::PurchaseOrder.new(purchase_order_params)

    if @purchase_order.save
      redirect_to :action => "listproducts", :purchase_order_id=> @purchase_order.id

      #redirect_to admin_listproducts_url, notice: 'Purchase Order was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /spree/vendors/1
  def update
    if @purchase_order.update(purchase_order_params)
      
     # redirect_to admin_purchase_orders_url(:purchase_order_id => purchase_order), notice: 'Purchase Order was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /spree/vendors/1
  def destroy
    @purchase_order.destroy
    redirect_to admin_purchase_orders_url, notice: 'Purchase Order was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_purchase_order
      @purchase_order = Spree::PurchaseOrder.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
  def purchase_order_params
    params.require(:purchase_order).permit(:vendor_id, :received, :active)
    end
end
  end
end
