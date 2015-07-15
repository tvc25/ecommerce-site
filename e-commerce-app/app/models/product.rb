class Product < ActiveRecord::Base
  has_many :orders, through: :order_products
  has_many :order_products
  mount_uploader :image, AvatarUploader
end
