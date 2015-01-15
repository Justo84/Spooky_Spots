# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(
email: "admin@spooky-spots.com",
password: "password",
password_confirmation: "password",
username: "Admin",
role: "admin"
)

User.create(
email: "user@spooky-spots.com",
password: "password",
password_confirmation: "password",
username: "User",
role: ""
)

User.create(
email: "user2@spooky-spots.com",
password: "password",
password_confirmation: "password",
username: "User2",
role: ""
)
