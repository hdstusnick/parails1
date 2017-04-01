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
    new_c = Course.create(independent_study: x["independent_study"], name: x["name"], code: x["code"], description: x["description"])
    relate_subjects_and_courses(x, new_c)
  end
end

def relate_subjects_and_courses(course, new_course)

  course['subjects'].each do |subject|
    subject_id = subject['id']
    subject = Subject.find_by(subject_type_id: subject_id)

    if subject
      CourseSubject.find_or_create_by(course: new_course, subject: subject)
    end
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
    Subject.create(name: x["name"], subject_type_id: x["id"])
  end
end
seed_subjects
seed_courses
seed_instructors
