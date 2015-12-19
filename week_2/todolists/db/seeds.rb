# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Profile.destroy_all
TodoList.destroy_all

User.create! [
  { username: 'Fiorina', password_digest: '123' },
  { username: 'Trump', password_digest: '123' },
  { username: 'Carson', password_digest: '123' },
  { username: 'Clinton', password_digest: '123' }
]

profiles = [
  { first_name: 'Carly', last_name: 'Fiorina', birth_year: 1954, gender: 'female' },
  { first_name: 'Donald', last_name: 'Trump', birth_year: 1946, gender: 'male' },
  { first_name: 'Ben', last_name: 'Carson', birth_year: 1951, gender: 'male' },
  { first_name: 'Hillary', last_name: 'Clinton', birth_year: 1947, gender: 'female' }
]

todo_lists = [
  { list_name: 'first', list_due_date: 1.year.since },
  { list_name: 'second', list_due_date: 1.year.since },
  { list_name: 'third', list_due_date: 1.year.since },
  { list_name: 'fourth', list_due_date: 1.year.since }
]

todo_items = []

5.times do |i|
  todo_items.push(
      {
        due_date: 1.year.since, title: "title #{i}", description: "description #{i}"
      }
    )
end

User.all.each_with_index do |user, index|
  user.create_profile(profiles[index])
  user.todo_lists.create(todo_lists[index])
end

TodoList.all.each_with_index do |list, index|
  list.todo_items.create(todo_items)
end
