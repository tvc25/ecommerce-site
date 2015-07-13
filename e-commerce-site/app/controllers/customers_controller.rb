class CustomersController < ApplicationController
  def index
    @customers = Customer.all
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
