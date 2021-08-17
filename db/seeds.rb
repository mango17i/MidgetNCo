require 'faker'

15.times do
  Offer.new({
              title: Faker::FunnyName.name,
              description: Faker::Lorem.sentence(word_count: 10),
              price: rand(20..100),
              user_id: rand(1..3)
            })
end

user = User.new(
  email: "admin@admin.com",
  password: "123456",
  password_confirmation: "123456"
)
user.save!

user2 = User.new(
  email: "passepartout@gmail.com",
  password: "123456",
  password_confirmation: "123456"
)
user2.save!
