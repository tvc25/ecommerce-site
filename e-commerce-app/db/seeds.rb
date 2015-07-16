# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Order.delete_all
Product.delete_all
Profile.delete_all
OrderProduct.delete_all
Category.delete_all

# Create customer objects
u1 = User.create!(name: 'Don Draper', email: 'don.draper@scpd.com',password: 'remember', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2014-12-31 22:27:09", last_sign_in_at: "2014-12-31 22:27:09", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1")
u2 = User.create!(name: 'Burt Cooper', email: 'burt.cooper@scpd.com',password: 'remember', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2014-12-31 22:27:09", last_sign_in_at: "2014-12-31 22:27:09", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1")
u3 = User.create!(name: 'Lane Price', email: 'lane.price@scpd.com',password: 'remember', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2014-12-31 22:27:09", last_sign_in_at: "2014-12-31 22:27:09", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1")
u4 = User.create!(name: 'Roger Sterling', email: 'roger.sterling@scpd.com',password: 'remember', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2014-12-31 22:27:09", last_sign_in_at: "2014-12-31 22:27:09", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1")

# Create Category
ct1 = Category.create!(name: 'Electronics')

# Create products objects
p1 = Product.create(name: 'DUNHILL CHASSIS TEXTURED-LEATHER BRIEFCASE', price: 950)
p2 = Product.create(name: 'Mac Pro', price: 20)
p3 = Product.create(name: 'MacBook Air', price: 30)
p4 = Product.create(name: 'iPhone', price: 34)

# Method 1
o1 = u1.orders.create(order_reference: 'fd5skfjh', amount: 500)
o2 = u2.orders.create(order_reference: 'fd5sk2jh', amount: 400)
o3 = u3.orders.create(order_reference: 'fd5sk4jh', amount: 200)
o3 = u3.orders.create(order_reference: 'fd5sk5jh', amount: 200)

#Method 2
Order.create(order_reference: 'f4ds5fjh', amount: 300, user_id: u2.id)
#Method 3
o3 = Order.create(order_reference: 'fds5kfjh', amount: 500)
o3.user_id = u1.id
o3.save

# Assign products to orders - creating order_product objects and saving them to the database

o1.order_products.create(product_id: p1.id)
o1.order_products.create(product_id: p3.id)
o2.order_products.create(product_id: p2.id)
p1.order_products.create(order_id: o3.id)

# Creating a profile object and assigning to a customer

# Method 1
pr1 = Profile.create(email:'don.draper@scpd.com')
pr1.user_id = u1.id
pr1.save
# Method 2
pr2 = Profile.create(email:'burt.cooper@scpd.com', user_id: u2.id)