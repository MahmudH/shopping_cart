class StocksController < ApplicationController
  def index
    @stocks = Stock.all
  end

  def new
  end

  def create
    Stock.create(stock_params)
    redirect_to '/stocks'
  end

  private

  def stock_params
    params.require(:stock).permit(:name, :category, :price, :qty)
  end
end
