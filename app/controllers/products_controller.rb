class ProductsController < ApplicationController
  before_action :authorize
  before_action :find_product, { only: [:edit, :update, :show, :destroy] }

  def index
    # @products = filter_products
    @products = Product.expensive_first

    respond_to do |format|
      format.html
      format.json { render :json => @products.to_json }
      format.xml { render :xml => @products.to_xml }
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = 'Product created successfully :)'
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @product.destroy
    flash[:notice] = 'Product deleted successfully!'
    redirect_to products_path
  end

  def expensive
    @products = Product.expensive_latest
  end

  def cheap
    @products = Product.cheap_latest
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :seller_id, :category_id);
  end

  def find_product
    @product = Product.find(params[:id])
  end

  # def filter_products
  #   if params[:category]
  #     category = Category.where(name: params[:category])
  #     products = Product.where(category: category).order(price: :desc)
  #   else
  #     products = Product.order(price: :desc)
  #   end
  # end
end
