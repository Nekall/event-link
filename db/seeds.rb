4.times do
  User.create([{
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: ["thp1@yopmail.com", "thp2@yopmail.com", "thp3@yopmail.com", "thp4@yopmail.com"].sample
  }])
end
