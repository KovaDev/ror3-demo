# jedan od nacina za definisanje modula/namespace-a
# module Admin
#   class ProductsController < ApplicationController
#   end
# end

class Admin::ProductsController < Admin::BaseController
  before_action :find_product, { only: [:edit, :update, :show, :destroy] }

  def index
    @products = Product.order(price: :desc)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = 'Product created successfully :)'
      redirect_to [:admin, @product]
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    if @product.update(product_params)
      respond_to do |format|
        format.html { redirect_to [:admin, @product] }
        format.js
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.js
      end
    end
  end

  def show
  end

  def destroy
    @product.destroy
    flash[:notice] = 'Product deleted successfully!'
    redirect_to admin_products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :seller_id, :category_id);
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
