# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Category.destroy_all
Task.destroy_all
sample_body = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.


Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

User.create!([
  {
    email: "test@test.com",
    username: "Jon Doe",
    password: "test12345",
    password_confirmation: "test12345"
  },
  {
    email: "test2@test.com",
    username: "Hoe Jon",
    password: "test12345",
    password_confirmation: "test12345"
  },
  {
    email: "test3@test.com",
    username: "Jane Bow",
    password: "test12345",
    password_confirmation: "test12345"
  },
  {
    email: "test4@test.com",
    username: "Sangre Amihan",
    password: "test12345",
    password_confirmation: "test12345"
  }
])


User.all.each do |user|
  user.categories.create!([
    {
      name: "Personal",
      description: "Personal Category from seed file"
    },
    {
      name: "Work",
      description: "Work Category from seed file"
    },
    {
      name: "House Chores",
      description: "House Chores Category from seed file"
    },
    {
      name: "Hobbies",
      description: "Hobbies Category from seed file"
    }
  ])
  p "Created #{user.categories.count} categories under #{user.email}"
end

Category.all.each do |category|
  category.tasks.create!([
    {
      user_id: category.user_id,
      title: "Do something nice",
      body: sample_body,
      status: "new",
      due_date: Time.at(0.0 + rand(1..1.1) * (Time.now.to_f - 0.0.to_f))
    },
    {
      user_id: category.user_id,
      title: "Go outside and plant trees",
      body: sample_body,
      status: "ongoing",
      due_date: Time.at(0.0 + rand(1..1.1) * (Time.now.to_f - 0.0.to_f))
    },
    {
      user_id: category.user_id,
      title: "Bake some cookies",
      body: sample_body,
      status: "completed",
      due_date: Time.at(0.0 + rand(1..1.1) * (Time.now.to_f - 0.0.to_f))
    },
    {
      user_id: category.user_id,
      title: "Read Physics books for fun",
      body: sample_body,
      status: "new",
      due_date: Date.today - rand(3..10).days
    }
  ])
  p "Created #{category.tasks.count} tasks under #{category.name.capitalize} of #{category.user.email}"
end

