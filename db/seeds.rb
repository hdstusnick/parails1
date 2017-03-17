# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
def seed_courses
  seed = JSON.parse(File.read('db/JSON/course.json'))

  seed.each do |x|
    Course.create(independent_study: x["independent_study"], name: x["name"], code: x["code"], description: x["description"])
  end
end

def seed_instructors
  seed = JSON.parse(File.read('db/JSON/instructor.json'))

  seed.each do |x|
    Instructor.create(middle: x["middle"], last: x["last"], first: x["first"], email: x["email"])
  end
end
def seed_subjects
  seed = JSON.parse(File.read('db/JSON/subject.json'))

  seed.each do |x|
    Subject.create(name: x["name"])
  end
end
seed_courses
seed_instructors
seed_subjects
