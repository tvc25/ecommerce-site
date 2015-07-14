class Product < ActiveRecord::Base
  has_many :order_products, dependent: :destroy
  has_many :orders, through: :order_products
  belongs_to :category
  # mount_uploader :avatar, AvatarUploader
  # default_scope { where(active: true) }
end
