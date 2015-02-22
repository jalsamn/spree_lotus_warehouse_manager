module Spree
  module Admin

class VendorsController < Spree::Admin::BaseController
  before_action :set_vendor, only: [:show, :edit, :update, :destroy]

  # GET /spree/vendors
  def index
    @vendors = Spree::Vendor.all
  end

  # GET /spree/vendors/1
  def show
  end

  # GET /spree/vendors/new
  def new
    @vendor = Spree::Vendor.new
  end

  # GET /spree/vendors/1/edit
  def edit
  end

  # POST /spree/vendors
  def create
    @vendor = Spree::Vendor.new(vendor_params)

    if @vendor.save
      redirect_to admin_vendor_url(@vendor), notice: 'Vendor was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /spree/vendors/1
  def update
    if @vendor.update(vendor_params)
      redirect_to admin_vendor_url(vendor), notice: 'Vendor was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /spree/vendors/1
  def destroy
    @vendor.destroy
    redirect_to admin_vendors_url, notice: 'Vendor was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor
      @vendor = Spree::Vendor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vendor_params
      params.require(:vendor).permit(:vendorname, :contactname, :email, :phone, :address1, :address2, :city, :country, :state, :zip, :active)
    end
end
  end
end

