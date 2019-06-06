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
  ['OOP in Ruby', 0, categories[0].id],
  ['OOP in PHP', 1, categories[1].id],
  ['ES6: new features', 2, categories[2].id]
]
tests.each do |title, level, category_id|
  Test.create(title: title, level: level, category_id: category_id)
end

questions = [
  ['What is an Object?', tests[0].id],
  ['What is a Class', tests[1].id],
  ['What is an Arrow Function?', tests[2].id]
]
questions.each do |body, test_id|
  Question.create(body: body, test_id: test_id)
end

answers = [
  ['Object is an instance of a class', true, questions[0].id],
  ['A blueprint for an object', true, questions[1].id],
  ['Compact alternative to a regular function expression', true, questions[2].id]
]
answers.each do |body, correct, question_id|
  Answer.create(body: body, correct: correct, question_id: question_id)
end

users = [
  ['Peter Pan', 'peterpan@pp.com', 'qwerty']
]
users.each { |username, email, password| User.create(username: username, email: email, password: password) }
