module Spree
  module Admin

class TempPoItemsController < Spree::Admin::BaseController
  
  
   # GET /spree/vendors/1
  def show
  end

  # GET /spree/vendors/new
  def new
    @tpoi = Spree::TempPoitem.new
  end

  # GET /spree/vendors/1/edit
  def edit
  end

  # POST /spree/vendors
  def create
    @tpoi = Spree::TempPoitem.new(tpoi_params)

    if @tpoi.save
      redirect_to admin_temp_po_item_url(@tpoi), notice: 'Vendor was successfully created.'
    else
      render :new
    end
  end
  
  def tpoi_params
    params.require(:tpoi).permit(:po_id, :variant_id)
  end
  
end
    end
end
