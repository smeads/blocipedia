# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# creates users
10.times do
  User.create!(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: "helloworld",
    confirmed_at: "2016-08-4 18:00:00"
  )
end
users = User.all

# creates wikis
20.times do
  Wiki.create!(
    title: Faker::Hipster.sentence(2),
    body: Faker::Hipster.paragraph(4, true, 2),
    private: false,
    user_id: rand(User.count)
  )
end
wikis = Wiki.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
