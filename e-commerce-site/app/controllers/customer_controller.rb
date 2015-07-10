class CustomersController < ApplicationController
  def index
    @customers = Customer.all
    render json: @customers
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
