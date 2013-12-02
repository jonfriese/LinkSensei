# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |i|
  User.create(name: "user#{i+1}", email: "user#{i}@example.com", password: "password", public_status: true)
  10.times do |j|
    Container.create(name: "container#{j+1}", user_id: "#{i+1}")
    # 10.times do
    #   Link.create(name: "google", url: "www.google.com", user_id: "#{i}", container_id: "#{j}")
    # end
  end
end
