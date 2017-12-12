User.create!(name:  "Alex",
             email: "alex@agile.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)
             
User.create!(name:  "Mohaamed",
             email: "mohammed@agile.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: false)
             
User.create!(name:  "Wonjoon",
             email: "wonjoon@agile.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: false)

User.create!(name:  "Jakub",
             email: "jakub@agile.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: false)
             
User.create!(name:  "Dara",
             email: "dara@agile.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: false)
             
users = User.order(:created_at).take(5)
50.times do
  body = Faker::Lorem.sentence(5)
  title = Faker::Lorem.sentence(2)
  users.each { |user| user.questions.create!(body: body,title: title) }
end