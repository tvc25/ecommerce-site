# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Customer.delete_all
Order.delete_all
Product.delete_all
Profile.delete_all
OrderProduct.delete_all
Category.delete_all

# Create customer objects
c1 = Customer.create(first_name: 'Don', last_name: 'Draper', first_line: "17 Woronzow Road", second_line: "St John's Wood", city: "London", postCode: "NW8 6BA")
c2 = Customer.create(first_name: 'Burt', last_name: 'Cooper', first_line: "17 Woronzow Road", second_line: "St John's Wood", city: "London", postCode: "NW8 6BA")
c3 = Customer.create(first_name: 'Lane', last_name: 'Price', first_line: "17 Woronzow Road", second_line: "St John's Wood", city: "London", postCode: "NW8 6BA")

# Create Category
ct1 = Category.create!(name: 'Electronics')

# Create products objects
p1 = Product.create(name: 'MacBook Pro')
p2 = Product.create(name: 'Mac Pro')
p3 = Product.create(name: 'MacBook Air')
p4 = Product.create(name: 'iPhone')

# Method 1
o1 = c1.orders.create(order_reference: 'fd5skfjh', amount: 500)
o2 = c2.orders.create(order_reference: 'fd5sk2jh', amount: 400)
o3 = c3.orders.create(order_reference: 'fd5sk3jh', amount: 200)

# Method 2
# Order.create(order_reference: 'f4ds5fjh', amount: 300, customer_id: c2.id)
# Method 3
o3 = Order.create(order_reference: 'fds5kfjh', amount: 500)
o3.customer_id = c1.id
o3.save

# Assign products to orders - creating order_product objects and saving them to the database

o1.order_products.create(product_id: p1.id)
o1.order_products.create(product_id: p3.id)
o2.order_products.create(product_id: p2.id)
p1.order_products.create(order_id: o3.id)

# Creating a profile object and assigning to a customer

# Method 1
pr1 = Profile.create(email:'tobiacassandro@gmail.com')
pr1.customer_id = c2.id
pr1.save
# Method 2
pr2 = Profile.create(email:'cloecassandro@gmail.com', customer_id: c3.id)
<<<<<<< HEAD
=======

OrderStatus.delete_all

OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"
>>>>>>> development
