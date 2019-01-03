# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(email: "bruce@gmail.com", password: "password1234", password_confirmation: "password1234")
user2 = User.create(email: "nicole@gmail.com", password: "password1234", password_confirmation: "password1234")

category1 = Category.create(name: "test_category_1", description: "test_category", user: user1)
category2 = Category.create(name: "test_category_2", description: "test_category", user: user1)

task1 = Task.create(name: "test_task_1", user: user1)
task1.categories << [category1, category2]