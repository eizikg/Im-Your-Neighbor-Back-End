require 'faker'
require 'chatkit'
include Faker
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
# manny = Volounteer.first
# eizik = Volounteer.find(3)
# breindy =Volounteer.find(10)
#
# group1 = Group.first
# group2 = Group.second
# group3 = Group.create(name: "home fixers", description: "we fix homes")
#
#
# event1 = Event.create(active: true, description: "my my is very broken", group_id: 1)
# event2 = Event.create(active: true, description: "can't get out my car", group_id: 1)
# event3 = Event.create(active: true, description: "change a lightbulb", group_id: 1)
# event4 = Event.create(active: true, description: "plow the snow", group_id: 1)
# event5 = Event.create(active: true, description: "i have a flat", group_id: 1)
# event6 = Event.create(active: true, description: "im locked out of my appartment", group_id: 1)
chatkit = Chatkit::Client.new({
  instance_locator: 'v1:us1:411b0598-90f0-462c-9c5e-7700603c4122',
  key: 'dabd03b3-b4d0-472d-9ebd-df69eac61ef7:VgvPufaNN+RnU0216cU9eZX+TCLDHl1rzi0D+lmC3SA=',
  })
10.times do
  @user = Volounteer.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    lat: rand(-0.0000000000006)+41.1180516,
    lng: rand(-0.0000000000006)-74.05122919999997,
    password: "1234",
    neighborhood: "Lower Manhatten"
  )
  if @user.save
  chatkit.create_user({ id: @user.email, name: "#{@user.first_name} #{@user.last_name}" })
  end
end

# 10.times do
#   group_id = rand(5)
#   volounteer_id = rand(245..300)
#   GroupVolounteer.create(group_id: group_id, volounteer_id: volounteer_id)
# end
