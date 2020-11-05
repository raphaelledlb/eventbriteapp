require 'faker'
Faker::Config.locale = :fr

User.destroy_all
Event.destroy_all
Attendance.destroy_all

10.times do |index|
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    
    User.create!(
        first_name: first_name,
        last_name: last_name,
        email: "#{first_name}.#{last_name}@yopmail.com",
        description: Faker::Lorem.paragraph,
        password: Faker::Superhero.power
    )
end

5.times do
    Event.create!(start_date: Faker::Date.forward(days: 23), 
    duration: rand(1..40) * 5, 
    title: Faker::Lorem.sentence(word_count: 5), 
    description: Faker::Lorem.paragraph, 
    price: rand(1..1000), 
    location: Faker::Address.city, 
    organizer_id: User.id.sample)
end
  
5.times do
    Attendance.create!(stripe_customer_id: Faker::Superhero.power, 
    user_id: User.id.sample, 
    event_id: Event.id.sample)
end