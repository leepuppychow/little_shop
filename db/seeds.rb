# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create!(username: "KillaCam", password: "password")

category1 = Category.create!(name: "Master")
category2 = Category.create!(name: "Padawan")

item1 = Item.create!(name: "Green Lightsaber", description: "the best", price: 100.0, image: "http://images.buystarwarstoys.com/products/9288/1-1/ahsoka-tano-toy-lightsaber.jpg", category: category1)
item2 = Item.create!(name: "Blue Lightsaber", description: "the second best", price: 200.0, image: "https://target.scene7.com/is/image/Target/17133411?wid=520&hei=520&fmt=pjpeg", category: category2)

order1 = Order.create(status: "complete", total_price: 100.00, address: "123 Turing Way", created_at: Date.today, updated_at: Date.today, user: user1)
order2 = Order.create(status: "pending", total_price: 500.00, address: "123 Turing Way", created_at: Date.today, updated_at: Date.today, user: user1)
