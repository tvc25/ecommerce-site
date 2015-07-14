class CartsController < ApplicationController
  def show
    @order_items = current_order.order_products
    @order = Order.new
    binding.pry
    order_prices = []
    @order_items.each {|order| order_prices.push (order.product.price.to_i) }
    @total_order_price = order_prices.inject{|sum,x| sum + x }
  end

end
