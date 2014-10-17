# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :price do
    regular_price 1.5
    sale_price 1.5
    employee_discount 1.5
    emp_dis_on_sale_price 1.5
  end
end
