require 'faker'
addresses = [
  '81 rue Gustave Eiffel 44400 REZÉ',
  '55 rue du Président Roosevelt 78500 SARTROUVILLE',
  '100 rue Petite Fusterie 62200 BOULOGNE-SUR-MER',
  '65 rue de la Hulotais 59430 SAINT-POL-SUR-MER',
  '126 rue de la République	69002 LYON',
  '3 rue Jean Robert 75018 PARIS',
  '51 rue Sedaine 75011 PARIS',
  '33 rue Estelle 13000 Marseille',
  '1340 arc de meyran Aix en Provence 13100',
  '14 rue Bichat 75010 PARIS',
  '53 rue Marx Dormoy 75018 PARIS'
]
puts 'seeeding'
puts 'destroying old reservations'
Reservation.destroy_all
puts 'destroying old offers'
Offer.destroy_all
puts 'creating offers'
11.times do |index|
  offer = Offer.new(
    title: Faker::FunnyName.name,
    description: Faker::Lorem.sentence(word_count: 20),
    price: rand(20..100),
    user_id: User.all.sample.id,
    address: addresses[index]
  )
  offer.save!
  puts 'one offer created'
  puts offer.address
end

puts 'done seeding'
