class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

   def calc_total_price
    session[:cart].map do |order_product|
      orderProduct = OrderProduct.find order_product
      orderProduct.quantity * orderProduct.product.price
    end.inject(:+)
  end
end
