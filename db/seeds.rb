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

Location.create(
name: "Miskatonic University",
state: "MA",
town: "Arkham",
description: "Miskatonic University is a university located in Arkham, a town in Essex County, Massachusetts. It is named after the Miskatonic River.",
size: "Huge",
history: "Miskatonic University is famous for its collection of Cthulhu Mythos arcane literature and occult books. The library at the university holds one of the few genuine copies of the Necronomicon. Other tomes held at the library include the Unaussprechlichen Kulten by Friedrich von Junzt and the fragmentary Book of Eibon. Miskatonic has a medical school.",
private_land: "Yes",
in_use: "Yes",
user_id: 1
)
