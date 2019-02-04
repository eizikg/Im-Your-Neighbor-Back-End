# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

manny = Volounteer.first
eizik = Volounteer.find(3)
breindy =Volounteer.find(10)

group1 = Group.first
group2 = Group.second
group3 = Group.create(name: "home fixers", description: "we fix homes")


event1 = Event.create(active: true, description: "my my is very broken", group_id: 1)
event2 = Event.create(active: true, description: "can't get out my car", group_id: 1)
event3 = Event.create(active: true, description: "change a lightbulb", group_id: 1)
event4 = Event.create(active: true, description: "plow the snow", group_id: 1)
event5 = Event.create(active: true, description: "i have a flat", group_id: 1)
event6 = Event.create(active: true, description: "im locked out of my appartment", group_id: 1)
