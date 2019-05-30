# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


categories = [['Ruby'], ['PHP'], ['JS']]
categories.each { |category_name| Category.create(title: category_name) }

tests = [
  ['OOP in Ruby', 0, 1],
  ['OOP in PHP', 1, 2],
  ['ES6: new features', 2, 3]
]
tests.each do |title, level, category_id|
  Test.create(title: title, level: level, category_id: category_id)
end

questions = [
  ['What is an Object?', 1],
  ['What is a Class', 2],
  ['What is an Arrow Function?', 3]
]
questions.each do |body, test_id|
  Question.create(body: body, test_id: test_id)
end

answers = [
  ['Object is an instance of a class', true, 1],
  ['A blueprint for an object', true, 2],
  ['Compact alternative to a regular function expression', true, 3]
]
answers.each do |body, correct, question_id|
  Answer.create(body: body, correct: correct, question_id: question_id)
end

users = [
  ['Peter Pan', 'peterpan@pp.com', 'qwerty']
]
users.each { |username, email, password| User.create(username: username, email: email, password: password) }
