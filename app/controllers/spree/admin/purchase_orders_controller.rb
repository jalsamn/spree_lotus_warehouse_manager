module Spree
  module Admin

class PurchaseOrdersController < Spree::Admin::BaseController
  before_action :set_purchase_order, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: :add_individual_products_1

  # GET /spree/vendors
  def index
    @purchase_orders = Spree::PurchaseOrder.all
  end

 
  
  # GET /spree/vendors/1
  def show
  end
  
  def listproducts
    @vendor = Spree::Vendor.find(params[:vendor_id]) 
    @purchase_order = Spree::PurchaseOrder.find(params[:purchase_order_id])  
    @s_vars = Spree::Variant.where(vendor_id: @vendor.id).sort_by {|obj| obj.total_on_hand }
    @sorted_vars = Kaminari.paginate_array(@s_vars).page(params[:page]).per(25)
  end
  
  def addindividualproducts
    @tpoi = Spree::TempPo.new()
    @tpoi.po_id = params[:po_id]
    @tpoi.var_id = params[:variant_id]
    
    respond_to do |format|
        if @tpoi.save
          format.html { redirect_to admin_listproducts_path, notice: 'Updated' }
          format.js
        else
            format.html { render action: "listproducts" }
        end
    end
  end

  #Below code is too invoke view that will ask for which products to add to PO
  def add_individual_products
    
    @tpois = Spree::TempPo.where(po_id: params[:purchase_order_id])
    @purchase_order = Spree::PurchaseOrder.find(params[:purchase_order_id])  
    
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
      @vendor = Spree::Vendor.find(@purchase_order.vendor_id)  
      @purchase_order_items = @purchase_order.purchase_order_items
    
      respond_to do |format|
        format.html
        format.pdf do
          render :pdf => "PurchaseOrder", :header => { :right => '[page] of [topage]' }
         end
  end
    
  end
  
  def delete_purchase_order_item
    @poit = Spree::PurchaseOrderItem.find(params[:po_item]).destroy
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
      redirect_to :action => "listproducts", :purchase_order_id => @purchase_order.id, :vendor_id => @purchase_order.vendor_id

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

