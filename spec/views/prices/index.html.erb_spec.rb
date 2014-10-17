require 'rails_helper'

RSpec.describe "prices/index", :type => :view do
  before(:each) do
    assign(:prices, [
      Price.create!(
        :regular_price => 1.5,
        :sale_price => 1.5,
        :employee_discount => 1.5,
        :emp_dis_on_sale_price => 1.5
      ),
      Price.create!(
        :regular_price => 1.5,
        :sale_price => 1.5,
        :employee_discount => 1.5,
        :emp_dis_on_sale_price => 1.5
      )
    ])
  end

  it "renders a list of prices" do
    render
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
