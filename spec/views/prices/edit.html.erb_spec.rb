require 'rails_helper'

RSpec.describe "prices/edit", :type => :view do
  before(:each) do
    @price = assign(:price, Price.create!(
      :regular_price => 1.5,
      :sale_price => 1.5,
      :employee_discount => 1.5,
      :emp_dis_on_sale_price => 1.5
    ))
  end

  it "renders the edit price form" do
    render

    assert_select "form[action=?][method=?]", price_path(@price), "post" do

      assert_select "input#price_regular_price[name=?]", "price[regular_price]"

      assert_select "input#price_sale_price[name=?]", "price[sale_price]"

      assert_select "input#price_employee_discount[name=?]", "price[employee_discount]"

      assert_select "input#price_emp_dis_on_sale_price[name=?]", "price[emp_dis_on_sale_price]"
    end
  end
end
