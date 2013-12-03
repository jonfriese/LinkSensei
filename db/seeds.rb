# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

3.times do |i|
  u = User.create(name: Faker::Name.first_name, email: "user#{i+1}@example.com", password: "password", public_status: true)
  10.times do |j|
    container_name = Faker::Lorem.word
    if container_name.length < 5 || container_name.length > 20
      container_name = "Container #{j}"
    end

    c = u.containers.create( name: container_name, description: Faker::Lorem.paragraph[0..200], clone_count: 0)
    5.times do
      l = c.links.create( name: Faker::Lorem.word, url: Faker::Internet.domain_name, description: Faker::Lorem.sentence[0..120])
    end
  end
end
