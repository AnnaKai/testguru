# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([{ title: 'Ruby'}, { title: 'PHP'}, {title: 'JS'}])

tests = Test.create([
  { title: 'OOP in Ruby', level: 1, category_id: categories[0].id },
  { title: 'OOP in PHP', level: 2, category_id: categories[1].id },
  { title: 'ES6: new features', level: 3, category_id: categories[2].id }
])

questions = Question.create([
  { body: 'What is an Object?', test_id: tests[0].id },
  { body: 'What is a Class', test_id: tests[1].id },
  { body: 'What is an Arrow Function?', test_id: tests[2].id}
])

answers = Answer.create([
  { body: 'Object is an instance of a class', correct: true, question_id: questions[0].id },
  { body: 'A blueprint for an object', correct: true, question_id: questions[1].id },
  { body: 'Compact alternative to a regular function expression', correct: true, question_id: questions[2].id }
])

users = [
  ['Peter Pan', 'Peter', 'peterpan@pp.com', 'Admin']
]
users.each { |username, email, first_name, type| User.create(username: username, first_name: first_name, email: email, type: type) }
