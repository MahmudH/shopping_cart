class CartController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @cart = Cart.new
  end
end
