class ProductsController < ApplicationController
  def index
    @products = Product.all
    @order_item = current_order.order_items.new
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
