50.times do
  user = User.create({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: Faker::Number.between(23, 97)
    })
  Address.create({
    user_id: user.id,
    street_name: Faker::Address.street_name,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: Faker::Address.zip
    })
end

50.times do
  Item.create({name: Faker::Commerce.product_name,
  price: Faker::Number.between(1, 1000),
  description: Faker::Commerce.color})
end

50.times do
  Order.create({item_id: Faker::Number.between(1, 50),
  user_id: Faker::Number.between(1, 50),
  quantity: Faker::Number.between(1, 20)})
end



# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
