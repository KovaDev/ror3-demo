class HomeController < ApplicationController
  def index
    @welcome_message = 'Welcome to ruby on rails'
    @broj = 1
  end

  def test
    # puts params.inspect
  end

  def products
    @products = Product.all
  end
end
