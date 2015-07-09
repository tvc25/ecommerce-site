class OrderController < ApplicationController
  def index
    orders = Order.all
    render json: orders
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
