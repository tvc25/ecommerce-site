class ProductController < ApplicationController
  def index
     products = Product.all
     render json: products
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
