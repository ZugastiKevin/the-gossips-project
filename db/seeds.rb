#Creation des Users et des Cities en attendant d'avoir un page creation d'User, log etc...
User.destroy_all
City.destroy_all

4.times do
  city = City.create([{city_name: Faker::Address.city}])
end

1.times do
  User.create([{
  first_name: "Anne",
  last_name: "Honymous",
  description: "We are anonymous. We are legion. We do not forgive. We do not forget. Expect us!",
  age: Faker::Number.number(digits: 2),
  email: "xX_anounim_Xx@internet.fr",
  city_id: City.all.sample.id
  }])
end

puts "User et city créées"
