# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

3.times do |i|
  u = User.create(name: Faker::Name.name, email: "user#{i+1}@example.com", password: "password", public_status: true)
  10.times do
    c = u.containers.create( name: Faker::Name.title, description: "description" )
    5.times do
      l = c.links.create( name: Faker::Name.title, url: Faker::Internet.url, description: "a link" )
    end
  end
end
