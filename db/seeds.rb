User.destroy_all
City.destroy_all
Gossip.destroy_all
Comment.destroy_all
Like.destroy_all
# Gostag.destroy_all
# Tag.destroy_all
# PrivateMessage.destroy_all

require "faker"

10.times do |i|
  city = City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
  # tag = Tag.create(title: Faker::Superhero.descriptor)
  puts "create city #{i}"
end
puts "END OF CITIES"
user = User.create!(first_name: "anonymous", last_name: "anonymous", description: Faker::DcComics.title, email: Faker::Internet.email, age: rand(18..99), city_id: City.all.sample.id, password: "blank")

10.times do |i|
  x = rand(1..5)
  x.times do
    puts "create user #{i}"
    user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::DcComics.title, email: Faker::Internet.email, age: rand(18..99), city_id: City.all.sample.id, password: "blank")
    n = rand(2..10)
    n.times do
      puts "create gossip#{i}"
      gossip = Gossip.create!(title: Faker::DcComics.title, content: Faker::ChuckNorris.fact, user_id: user.id)
      # gostag = Gostag.create(gossip_id: Gossip.all.sample.id, tag_id: Tag.all.sample.id)
    end
  end
end
50.times do
  comment = Comment.create(content: Faker::Lorem.sentence(word_count: 10, supplemental: true), user_id: User.all.sample.id, gossip_id: Gossip.all.sample.id)
  puts comment.errors
end

100.times do |i|
  puts "create PM #{i}"
  pm = PrivateMessage.create(content: Faker::ChuckNorris.fact, sender_id: User.all.sample.id, recipient_id: User.all.sample.id)
end
