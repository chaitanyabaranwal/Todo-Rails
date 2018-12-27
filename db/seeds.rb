# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(username: 'Nicole', email: 'nicole@gmail.com', password: 'password1234', password_confirmation: 'password1234')
user2 = User.create(username: 'Bruce', email: 'bruce@gmail.com', password: 'password1234', password_confirmation: 'password1234')

1.upto(2) do |i|
	Category.create(name: "category #{i}", description: "test_category", user: user1)
end

3.upto(4) do |i|
	Category.create(name: "category #{i}", description: "test_category", user: user2)
end

1.upto(2) do |i|
	Task.create(name: "Task #{i}", user: user1, category_id: i)
end

3.upto(4) do |i|
	Task.create(name: "Task #{i}", user: user2, category_id: i)
end