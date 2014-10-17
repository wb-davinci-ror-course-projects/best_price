class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.float :regular_price
      t.float :sale_price
      t.float :employee_discount
      t.float :emp_dis_on_sale_price

      t.timestamps
    end
  end
end
