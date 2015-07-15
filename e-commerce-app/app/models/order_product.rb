class OrderProduct < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  def self.total(price)
    subtotal_array = price.map { |price| price.product.price * price.quantity }.inject(:+)
  end
end
