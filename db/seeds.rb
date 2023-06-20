require 'faker'

User.destroy_all

10.times do |i|
  password = Faker::Internet.password(min_length: 6)

  User.create!(
    email: "test_#{i}@gmail.com",
    password: 123456,
    password_confirmation: 123456
  )
end

User.all.each do |user|
  user.posts.create!([{ title: Faker::Book.title, body: Faker::Lorem.paragraph }, { title: Faker::Book.title, body: Faker::Lorem.paragraph }])
end
