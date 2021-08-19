require 'faker'

15.times do
  offer = Offer.new(
    title: Faker::FunnyName.name,
    description: Faker::Lorem.sentence(word_count: 10),
    price: rand(20..100),
    user_id: 1,
    address: Faker::Address.full_address
  )
  offer.save
end
