require 'rails_helper'

RSpec.describe "prices/show", :type => :view do
  before(:each) do
    @price = assign(:price, Price.create!(
      :regular_price => 1.5,
      :sale_price => 1.5,
      :employee_discount => 1.5,
      :emp_dis_on_sale_price => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
  end
end
