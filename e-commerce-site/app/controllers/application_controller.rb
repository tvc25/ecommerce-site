class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_order, :get_cart_count

  def current_order
    unless session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def get_cart_count
    unless session[:order_id].nil?
      o1 = Order.find(session[:order_id])
      o1.order_products.count
    end
  end

   def calc_total_price
    session[:cart].map do |order_product|
      orderProduct = OrderProduct.find order_product
      orderProduct.quantity * orderProduct.product.price 
    end.inject(:+)
  end

  def initialize_new_cart
    session[:cart] = []
    session[:order_id] = nil
  end
  
end
