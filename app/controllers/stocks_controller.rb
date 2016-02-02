class StocksController < ApplicationController
  def index
    @stocks = Stock.all
  end

  def new
    @stock = Stock.new
  end

  def create
    @stock = Stock.create(stock_params)
    redirect_to '/stocks'
  end

  def show
    @stock = Stock.find(params[:id])
  end

  def edit
    @stock = Stock.find(params[:id])
  end

  def update
    @stock = Stock.find(params[:id])
    @stock.update(stock_params)

    redirect_to '/stocks'
  end

  def destroy
    @stock = Stock.find(params[:id])
    @stock.destroy
    flash[:notice] = 'Item deleted successfully'
    redirect_to '/stocks'
  end

  private

  def stock_params
    params.require(:stock).permit(:name, :category, :price, :qty)
  end
end
