class PricesController < ApplicationController

  def root
    @price = Price.new
    render :sale_no_sale
  end

  def best_price
    sale_price = params[:sale_price].to_f
    regular_price = params[:regular_price].to_f
    employee_discount = params[:employee_discount].to_f
    sale_price > 0 ? final_sale_price = sale_price - (sale_price * 0.10) : sale_price = 'invalid'
    regular_price > 0 && employee_discount > 0 ? final_regular_price = regular_price * (1 - employee_discount) : regular_price = 'invalid'
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
end
