json.array!(@prices) do |price|
  json.extract! price, :id, :regular_price, :sale_price, :employee_discount, :emp_dis_on_sale_price
  json.url price_url(price, format: :json)
end
