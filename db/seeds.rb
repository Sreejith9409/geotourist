# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
1000.times do 
  user = User.new(name: Faker::Name.name, email: Faker::Internet.email)
  if user.save
  puts "User id = #{user.id}"
    10.times do 
      tour = Tour.new(name: Faker::Address.city, description: Faker::Address.street_address, user_id: user.id)
      if tour.save
      puts "Tour id = #{tour.id}"
        10.times do
          name = Faker::Address.city
          description = Faker::Address.street_address
          latitude = Faker::Address.latitude
          longitude = Faker::Address.longitude
          point = Point.new(name: name, description: description, tour_id: tour.id, latitude: latitude, longitude: longitude, user_id: user.id)
          if point.save
      puts "Point id = #{point.id}"

            view = View.new( latitude: latitude, longitude: longitude, user_id: user.id, tour_id: tour.id, point_id: point.id)
            view.save
            Visit.create(name: name, point_id: point.id)
          else
            debugger
          end
        end
      end
    end
  end
end