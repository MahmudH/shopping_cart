class AddPriceToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :price, :decimal, precision: 5, scale: 2
  end
end
