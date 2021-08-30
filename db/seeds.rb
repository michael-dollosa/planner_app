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

User.create!([
  {
    email: "test@test.com",
    password: "test12345",
    password_confirmation: "test12345"
  },
  {
    email: "test2@test.com",
    password: "test12345",
    password_confirmation: "test12345"
  },
  {
    email: "test3@test.com",
    password: "test12345",
    password_confirmation: "test12345"
  },
  {
    email: "test4@test.com",
    password: "test12345",
    password_confirmation: "test12345"
  }
])


User.all.each do |user|
  user.categories.create!([
    {
      name: "Food #{user.id}",
      description: "Food Category from seed file"
    },
    {
      name: "Personal #{user.id}",
      description: "Personal Category from seed file"
    },
    {
      name: "Travel #{user.id}",
      description: "Travel Category from seed file"
    },
    {
      name: "Education #{user.id}",
      description: "Education Category from seed file"
    }
  ])
  p "Created #{user.categories.count} categories under #{user.email}"
end

Category.all.each do |category|
  category.tasks.create!([
    {
      title: "#{category.name.capitalize} Task 1",
      body: "#{category.name.capitalize} Task 1 body",
      status: "new",
      due_date: Time.at(0.0 + rand(1..1.1) * (Time.now.to_f - 0.0.to_f))
    },
    {
      title: "#{category.name.capitalize} Task 2",
      body: "#{category.name.capitalize} Task 2 body",
      status: "ongoing",
      due_date: Time.at(0.0 + rand(1..1.1) * (Time.now.to_f - 0.0.to_f))
    },
    {
      title: "#{category.name.capitalize} Task 3",
      body: "#{category.name.capitalize} Task 3 body",
      status: "completed",
      due_date: Time.at(0.0 + rand(1..1.1) * (Time.now.to_f - 0.0.to_f))
    },
    {
      title: "#{category.name.capitalize} Task 4",
      body: "#{category.name.capitalize} Task 4 body",
      status: "new",
      due_date: Time.at(0.0 + rand(1..1.1) * (Time.now.to_f - 0.0.to_f))
    }
  ])
  p "Created #{category.tasks.count} tasks under #{category.name.capitalize} of #{category.user.email}"
end

# Category.create!([
#   {
#     name: "Food",
#     description: "Food Category from seed file"
#   },
#   {
#     name: "Personal",
#     description: "Personal Category from seed file"
#   },
#   {
#     name: "Travel",
#     description: "Travel Category from seed file"
#   },
#   {
#     name: "Education",
#     description: "Education Category from seed file"
#   }
# ])

# p "Created #{Category.count} categories"

# Category.find_by_name("food").tasks.create!([
#   {
#     title: "Food Task 1",
#     body: "Food Task 1 body",
#     status: "new",
#     due_date: Time.at(0.0 + rand(1..1.1) * (Time.now.to_f - 0.0.to_f))
#   },
#   {
#     title: "Food Task 2",
#     body: "Food Task 2 body",
#     status: "ongoing",
#     due_date: Time.at(0.0 + rand(1..1.1) * (Time.now.to_f - 0.0.to_f))
#   },
#   {
#     title: "Food Task 3",
#     body: "Food Task 3 body",
#     status: "completed",
#     due_date: Time.at(0.0 + rand(1..1.1) * (Time.now.to_f - 0.0.to_f))
#   },
#   {
#     title: "Food Task 4",
#     body: "Food Task 4 body",
#     status: "new",
#     due_date: Time.at(0.0 + rand(1..1.1) * (Time.now.to_f - 0.0.to_f))
#   }
# ])

# p "Created Tasks for Food"

# Category.find_by_name("personal").tasks.create!([
#   {
#     title: "Personal Task 1",
#     body: "Personal Task 1 body",
#     status: "ongoing",
#     due_date: Time.at(0.0 + rand(1..1.1) * (Time.now.to_f - 0.0.to_f))
#   },
#   {
#     title: "Personal Task 2",
#     body: "Personal Task 2 body",
#     status: "completed",
#     due_date: Time.at(0.0 + rand(1..1.1) * (Time.now.to_f - 0.0.to_f))
#   },
#   {
#     title: "Personal Task 3",
#     body: "Personal Task 3 body",
#     status: "new",
#     due_date: Time.at(0.0 + rand(1..1.1) * (Time.now.to_f - 0.0.to_f))
#   },
#   {
#     title: "Personal Task 4",
#     body: "Personal Task 4 body",
#     status: "new",
#     due_date: Time.at(0.0 + rand(1..1.1) * (Time.now.to_f - 0.0.to_f))
#   }
# ])

# p "Created Tasks for Personal"

# Category.find_by_name("travel").tasks.create!([
#   {
#     title: "Travel Task 1",
#     body: "Travel Task 1 body",
#     status: "completed",
#     due_date: Time.at(0.0 + rand(1..1.1) * (Time.now.to_f - 0.0.to_f))
#   },
#   {
#     title: "Travel Task 2",
#     body: "Travel Task 2 body",
#     status: "ongoing",
#     due_date: Time.at(0.0 + rand(1..1.1) * (Time.now.to_f - 0.0.to_f))
#   },
#   {
#     title: "Travel Task 3",
#     body: "Travel Task 3 body",
#     status: "new",
#     due_date: Time.at(0.0 + rand(1..1.1) * (Time.now.to_f - 0.0.to_f))
#   },
#   {
#     title: "Travel Task 4",
#     body: "Travel Task 4 body",
#     status: "completed",
#     due_date: Time.at(0.0 + rand(1..1.1) * (Time.now.to_f - 0.0.to_f))
#   }
# ])

# p "Created Tasks for Travel"

# Category.find_by_name("education").tasks.create!([
#   {
#     title: "Education Task 1",
#     body: "Education Task 1 body",
#     status: "new",
#     due_date: Time.at(0.0 + rand(1..1.1) * (Time.now.to_f - 0.0.to_f))
#   },
#   {
#     title: "Education Task 2",
#     body: "Education Task 2 body",
#     status: "new",
#     due_date: Time.at(0.0 + rand(1..1.1) * (Time.now.to_f - 0.0.to_f))
#   },
#   {
#     title: "Education Task 3",
#     body: "Education Task 3 body",
#     status: "ongoing",
#     due_date: Time.at(0.0 + rand(1..1.1) * (Time.now.to_f - 0.0.to_f))
#   },
#   {
#     title: "Education Task 4",
#     body: "Education Task 4 body",
#     status: "ongoing",
#     due_date: Time.at(0.0 + rand(1..1.1) * (Time.now.to_f - 0.0.to_f))
#   }
# ])

# p "Created Tasks for Education"