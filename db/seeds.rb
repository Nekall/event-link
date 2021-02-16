User.destroy_all
Event.destroy_all
Attendance.destroy_all

#crée la base de données
1.times do
  puts "creation user"
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "yopmail@yopmail.com",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nisl eros, 
    pulvinar facilisis justo mollis, auctor consequat urna. Morbi a bibendum metus. 
    Donec scelerisque sollicitudin enim eu venenatis. Duis tincidunt laoreet ex, 
    in pretium orci vestibulum eget. Class aptent taciti sociosqu ad litora torquent",
    password: "courgette"
  )
end


5.times do
  puts "creation event"
  event = Event.create( 
    title: Faker::House.furniture,
    description: "enim eu venenatis. Duis tincidunt laoreet ex, 
    in pretium orci vestibulum eget",
    location: "Paris",
    price: [25,40,30,9999].sample,
    duration: [5,10,15,20,25,30,35,40].sample,
    start_date: ["2021-03-27 13:00:00","2021-03-03 14:55:00","2021-03-01 12:30:00","2021-03-30 08:20:00","2021-03-25 15:45:00"].sample
  )
end

5.times do
  puts "creation attendance"
  Attendance.create( 
    user_id: [1,2,3,4,5].sample,
    event_id: [1,2,3,4,5].sample
  )
end
puts "tu as fini"
