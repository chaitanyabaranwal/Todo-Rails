# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(username: 'Nicole', email: 'nicole@gmail.com', password: 'password1234', password_confirmation: 'password1234')
user2 = User.create(username: 'Bruce', email: 'bruce@gmail.com', password: 'password1234', password_confirmation: 'password1234')