class SellersController < ApplicationController
  def show
    @seller = Seller.find(params[:id])
    @seller_products = @seller.products
  end
end
