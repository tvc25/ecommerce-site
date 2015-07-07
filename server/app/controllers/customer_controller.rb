class CustomerController < ApplicationController
  def index
  customers = Customer.all.order(:id)
  render json: customers
  binding.pry
end
end
