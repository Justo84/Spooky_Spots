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

Location.create(
name: "Devil Reef",
state: "MA",
town: "Innsmouth",
street: "Devil's Highway",
description: "An offshore rock formation located in the sea near Innsmouth.",
size: "Huge",
history: "In 1846 during a sacrificial ritual at the reef Captain Marsh and several members of the Esoteric Order of Dagon were arrested, though no formal charges were made.  It was destroyed during the government raid of 1928.",
private_land: "No",
in_use: "No",
user_id: 2
)

Location.create(
name: "Dunwich Horror",
state: "MA",
town: "Dunwich",
street: "Miskatonic Valley",
description: "A well filled with... something evil.",
size: "Tiny",
history: "In the isolated, desolate and decrepit village of Dunwich, Wilbur Whateley is the hideous son of Lavinia Whateley, a deformed and unstable albino mother, and an unknown father (alluded to in passing by mad Old Whateley, as 'Yog-Sothoth'), and strange events surround his birth and precocious development. ",
private_land: "No",
in_use: "No",
user_id: 2
)

Review.create(
description: "Pretty creepy.  I got scared alot and left my girlfriend behind.  Never saw her again.  Would visit again!",
spo_rating: "4",
sce_rating: "1",
exp_rating: "2",
location_id: 3,
user_id: 1
)
