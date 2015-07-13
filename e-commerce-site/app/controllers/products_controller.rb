class ProductsController < ApplicationController
  def index
    @products = Product.all
    @order_product = current_order.order_products.new
  end

  def create
  end

  def show
  end

  def update
  end

  def destroy
  end
end
