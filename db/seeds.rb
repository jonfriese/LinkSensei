# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |i|
  User.create(name: "user#{i+1}", email: "user#{i+1}@example.com", password: "password", public_status: true)
  9.times do |j|
    Container.create(name: "container#{j+1}", user_id: i, description: "description")
    10.times do |k|
      Link.create(name: "link#{k+1}", url: "www.google.com", user_id: (i), container_id: (j), description: "a link")
    end
  end
end
