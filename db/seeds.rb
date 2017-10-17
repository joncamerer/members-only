User.create!(name:                  "Jon Camerer",
             email:                 "jon@example.com",
             password:              "password",
             password_confirmation: "password")

5.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "password"

  User.create!(name:                  name,
               email:                 email,
               password:              password,
               password_confirmation: password)
end
