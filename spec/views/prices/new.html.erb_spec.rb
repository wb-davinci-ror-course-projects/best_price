require 'rails_helper'

RSpec.describe "prices/new", :type => :view do
  before(:each) do
    assign(:price, Price.new(
      :regular_price => 1.5,
      :sale_price => 1.5,
      :employee_discount => 1.5,
      :emp_dis_on_sale_price => 1.5
    ))
  end

  it "renders new price form" do
    render

    assert_select "form[action=?][method=?]", prices_path, "post" do

      assert_select "input#price_regular_price[name=?]", "price[regular_price]"

      assert_select "input#price_sale_price[name=?]", "price[sale_price]"

      assert_select "input#price_employee_discount[name=?]", "price[employee_discount]"

      assert_select "input#price_emp_dis_on_sale_price[name=?]", "price[emp_dis_on_sale_price]"
    end
  end
end
