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
u1 = User.create!(name: 'Don Draper', email: 'don.draper@scdp.com',password: 'remember', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2014-12-31 22:27:09", last_sign_in_at: "2014-12-31 22:27:09", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1")
u2 = User.create!(name: 'Burt Cooper', email: 'burt.cooper@scdp.com',password: 'remember', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2014-12-31 22:27:09", last_sign_in_at: "2014-12-31 22:27:09", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1")
u3 = User.create!(name: 'Lane Price', email: 'lane.price@scdp.com',password: 'remember', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2014-12-31 22:27:09", last_sign_in_at: "2014-12-31 22:27:09", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1")
u4 = User.create!(name: 'Roger Sterling', email: 'roger.sterling@scdp.com',password: 'remember', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2014-12-31 22:27:09", last_sign_in_at: "2014-12-31 22:27:09", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1")

# Create Category
ct1 = Category.create!(name: 'Electronics')

# Create products objects
p1 = Product.create(designer: 'DUNHILL',name: 'CHASSIS TEXTURED-LEATHER BRIEFCASE', image: 'http://cache.mrporter.com/prod-img/images/products/594133/594133_mrp_in_l.jpg', description:"EDITORS' NOTES
A sleek briefcase is the surest way to make a sophisticated impression at meetings. Dunhill's handsome navy design is constructed from the label's signature 'Chassis' leather, which has been embossed to resemble carbon fibre and treated to resist scratches. The suede-lined interior is equipped with various pockets to keep you organised and has a sleeve sized to fit a laptop or tablet.", price: 950)
p2 = Product.create(designer: 'ACNE STUDIOS',name:'JOHNA COTTON-BLEND JERSEY HOODIE
', price: 180, description: "EDITORS' NOTES
Acne Studios' navy hoodie is crafted from cotton-blend jersey with a comfortable looped terry interior. This style is fitted with practical pockets and a two-way zip fastening through the front. Slip it on after workout sessions or on low-key weekends.", image:'https://cache.mrporter.com/prod-img/images/products/588208/588208_mrp_in_l.jpg')
p3 = Product.create!(designer: 'ACNE STUDIOS', name: 'ISHERWOOD SLIM-FIT COTTON-POPLIN SHIRT
', description: "EDITORS' NOTES
Acne Studios' popular 'Isherwood' shirt is updated in smooth, lightweight cotton-poplin. Cut for a comfortably trim fit and sharpened with a button-down collar, it's a dapper all-rounder. Wear it loose over dark denim or navy chinos.", price:160, image:'https//cache.mrporter.com/prod-img/images/products/588254/588254_mrp_in_l.jpg')
p2 = Product.create(name: '', price: 20)
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