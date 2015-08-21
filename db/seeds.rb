require_relative '../app/models/task'
require 'faker'

10.times do |i|
  Task.create(done: false, text: Faker::Lorem.sentence)
end