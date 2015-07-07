class Customer < ActiveRecord::Base
  # if we delete a customer object we delete all orders linked to that customer ( we do not want to leaave orphan rder objects)
   has_many :orders, dependent: :destroy
   has_one :profile
end
