class Price < ActiveRecord::Base
  validates :regular_price, :sale_price, presence:true
end
