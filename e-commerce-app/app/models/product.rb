class Product < ActiveRecord::Base
  mount_uploader :image, AvatarUploader
end
