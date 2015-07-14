class OrderProductsController < ApplicationController
before_action :set_order_product, only: [:show, :edit, :update, :destroy]

  def index
    if session[:cart]
      @order_products = OrderProduct.find session[:cart]
      @total = OrderProduct.total(@order_products)
    else
      @order_products = []
    end
  end

  # dont understand this, why is where empty? no id?
  def show
    @order_products = OrderProduct.where()
  end

  def edit
  end

  def new
    @order_products = OrderProduct.new
  end

 def create
      @order = current_order
      @order_product = @order.order_products.new(order_product)
      @order.save
      session[:order_id] = @order.id
      count = get_cart_count
      output = {'status' => 'Item was successfully added to the cart', count: count}
      render :json => {status: output}
    end

  # User proceed to payment from here.
  def checkout
    session[:order_id] = nil #add this to clear order_id hash everytime.
    # Everytime proceed to checkout, first thing to do is to check whether the order id in the session cart{:order_id}, otherwise create a new one
    @order = Order.find session[:order_id] || Order.create(:user_id => current_user.id)
    session[:order_id] = @order.id
    
    @updatedPrice = calc_total_price || ''

    # Associate each item in the cart with the new order id.
    session[:cart].each do |order_product_id|
      item = OrderProduct.find order_product_id
      item.order_id = @order.id
      item.save
    end
  end


  def update
    respond_to do |format|
      if @order_product.update(order_product_params)
        format.html { redirect_to @order_product, notice: 'Order product was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_product }
      else
        format.html { render :edit }
        format.json { render json: @order_product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # clear the product id in Cart before destroying the orderproduct. Otherwise cause problem when redirect to the index page after that, because no longer can find the same product id again.
    session[:cart].delete(params[:id].to_i)

    @updatedPrice = calc_total_price || ''
    # Destroy the item and redirect back to the same page.
    @order_product.destroy

    output = {'status' => 'Item was successfully removed from cart.', 'updatedPrice' => @updatedPrice}.to_json

    respond_to do |format|
      format.html { redirect_to order_products_url, notice: 'You have successfully removed one item from your shopping cart.' }
      format.json { render :json => output }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_product
      @order_product = OrderProduct.find(params[:id])
    end
end

 

  #   def update
  #     @order = current_order
  #     @order_product = @order.order_products.find(params[:id])
  #     @order_product.update_attributes(order_product_params)
  #     @order_products = @order.order_products
  #   end

  #   def destroy
  #     @order = current_order
  #     @order_product = @order.order_products.find(params[:id])
  #     @order_product.destroy
  #     @order_products = @order.order_products
  #   end
  # private
  #   def order_product_params
  #     params.require(:order_product).permit(:quantity, :product_id)
  #   end
