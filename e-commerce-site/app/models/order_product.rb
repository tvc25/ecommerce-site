class OrderProduct < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  
  # attr_accessible :order_id, :product_id, :quantity

  validates :product_id, :presence => true
  validates :quantity, :presence => true

  belongs_to :order
  belongs_to :product

  def self.total(price)
    subtotal_array = price.map { |price| price.product.price * price.quantity }.inject(:+)
  end
end
