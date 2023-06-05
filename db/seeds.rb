# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

2.times do
  u = User.create(name: Faker::Name.name, email: Faker::Internet.email )
  3.times do
    b = u.books.create(title: Faker::Name.unique.name,description: Faker::Lorem.sentence)
    2.times do
      b.essays.create(heading: Faker::Name.unique.name,detail: Faker::Lorem.sentence)
    end 
     
  end  
end