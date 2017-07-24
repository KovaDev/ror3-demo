class SellersController < ApplicationController
  def show
    @seller = Seller.find(params[:id])
    @seller_products = @seller.products
  end

  def products
    @products = Product.where(seller_id: params[:id])
  end
end
