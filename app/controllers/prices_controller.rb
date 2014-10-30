class PricesController < ApplicationController
  before_action :set_price, only: [:show, :edit, :update, :destroy]

  # GET /prices
  # GET /prices.json
  def root
    @price = Price.new
    render :sale_no_sale
  end

    def best_price
      sale_price = params[:sale_price].to_f
      regular_price = params[:regular_price].to_f
      employee_discount = params[:employee_discount].to_f
      sale_price > 0 ? final_sale_price = params[:sale_price].to_f - (params[:sale_price].to_f * 0.10) : sale_price = 'invalid'
      regular_price > 0 && employee_discount > 0 ? final_regular_price = params[:regular_price].to_f * (1 - params[:employee_discount].to_f) : regular_price = 'invalid'
      raise
      if sale_price == 'invlaid' || regular_price == 'invalid'
        redirect_to '/', notice: 'please enter numeric info for all fields'
      else
        if final_sale_price <= final_regular_price
          result_notice = "Go with sale price with 10% discount! $#{sprintf('%.2f', final_sale_price)}"
        else
          result_notice =  "Go with regular price with employee discount! $#{sprintf('%.2f', final_regular_price)}"
        end
        redirect_to '/', notice: result_notice
      end
  end

  # def result
  # end
  #
  # def index
  #   @prices = Price.all
  # end
  #
  # # GET /prices/1
  # # GET /prices/1.json
  # def show
  # end
  #
  # # GET /prices/new
  # def new
  #   @price = Price.new
  # end
  #
  # # GET /prices/1/edit
  # def edit
  # end
  #
  # # POST /prices
  # # POST /prices.json
  # def create
  #   @price = Price.new
  #   respond_to do |format|
  #     if @price.save
  #       format.html { redirect_to @price, notice: 'Price was successfully created.' }
  #       format.json { render :show, status: :created, location: @price }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @price.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # PATCH/PUT /prices/1
  # # PATCH/PUT /prices/1.json
  # def update
  #   respond_to do |format|
  #     if @price.update(price_params)
  #       format.html { redirect_to @price, notice: 'Price was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @price }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @price.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # DELETE /prices/1
  # # DELETE /prices/1.json
  # def destroy
  #   @price.destroy
  #   respond_to do |format|
  #     format.html { redirect_to prices_url, notice: 'Price was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end
  #
  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_price
  #     @price = Price.find(params[:id])
  #   end
    # Never trust parameters from the scary internet, only allow the white list through.
    # def price_params
    #   params.require(:price).permit(:regular_price, :sale_price, :employee_discount, :emp_dis_on_sale_price)
    # end
end
