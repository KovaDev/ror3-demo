class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def create
    # @order = Order.new
    # @order.user = current_user
    # @order.product_id = params[:product_id]
    # @order.save

    @order = current_user.orders.build
    @order.product_id = params[:product_id]
    @order.save

    respond_to do |format|
      format.js
    end
  end
end
