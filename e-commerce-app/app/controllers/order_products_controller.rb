class OrderProductsController < ApplicationController
  before_action :set_order_product, only: [:show, :edit, :update, :destroy]

  # GET /order_products
  # GET /order_products.json
  def index
    # session[:cart] = []
    if session[:cart]
      @order_products = OrderProduct.find session[:cart]
      @total = OrderProduct.total(@order_products)
  else
      @order_products = []
    end
  end

  def checkout
    session[:order_id] = nil #add this to clear order_id hash everytime. fix heroku issue
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

  # GET /order_products/1
  # GET /order_products/1.json
  def show
    # session[:cart] = []
    if session[:cart]
      @order_products = OrderProduct.find session[:cart]
      @total = OrderProduct.total(@order_products)
  else
      @order_products = []
    end
  end

  # GET /order_products/new
  def new
    @order_product = OrderProduct.new
  end

  # GET /order_products/1/edit
  def edit
  end

  # POST /order_products
  # POST /order_products.json
  def create
    @order_product = OrderProduct.new(order_product_params)

    respond_to do |format|
      if @order_product.save
        session[:cart] ||= []
        session[:cart].push @order_product.id

        count = get_cart_count
        output = {'status' => 'Item was successfully added to the cart.'}.to_json
        format.html { redirect_to @order_product, notice: 'Order product was successfully created.' }
        format.json { render :json => output }
      else
        format.html { render :new }
        format.json { render json: @order_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_products/1
  # PATCH/PUT /order_products/1.json
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

  # DELETE /order_products/1
  # DELETE /order_products/1.json
  def destroy
    # this is deleting one item from the cart
    session[:cart].delete(params[:id].to_i)
    @updatedPrice = calc_total_price || ''
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_product_params
      params.require(:order_product).permit(:order_id, :product_id, :quantity)
    end
end
