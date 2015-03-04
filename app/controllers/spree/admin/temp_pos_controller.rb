module Spree
  module Admin

class TempPosController < Spree::Admin::BaseController

  before_action :set_temp_po, only: [:show, :edit, :update, :destroy]

  # GET /temp_pos
  def index
    @temp_pos = Spree::TempPo.all
  end

  # GET /temp_pos/1
  def show
  end

  # GET /temp_pos/new
  def new
    @temp_po = Spree::TempPo.new
  end

  # GET /temp_pos/1/edit
  def edit
  end

  # POST /temp_pos
  def create
    @temp_po = Spree::TempPo.new(temp_po_params)

    if @temp_po.save
      redirect_to @temp_po, notice: 'Temp po was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /temp_pos/1
  def update
    if @temp_po.update(temp_po_params)
      redirect_to @temp_po, notice: 'Temp po was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /temp_pos/1
  def destroy
    @temp_po.destroy
    redirect_to temp_pos_url, notice: 'Temp po was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_temp_po
      @temp_po = Spree::TempPo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def temp_po_params
      params.require(:temp_po).permit(:po_id, :var_id)
    end
end
  end
end