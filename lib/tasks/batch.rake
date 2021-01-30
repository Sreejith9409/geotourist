namespace :batch do
  desc "Create View"
  task create_view: :environment do
    (1..30).each do |i|
      View.create( latitude: Faker::Address.latitude, longitude: Faker::Address.longitude, user_id: i)
      puts i
      sleep 1
    end
  end

  desc "Update User"
  task update_user: :environment do
    (1..30).each do |i|
      User.where(id: i).update_all(name: Faker::Name.name)
      puts i
      sleep 1
    end
  end
end
