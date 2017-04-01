class Course < ApplicationRecord
  has_many :course_subjects
  has_many :subjects, through: :course_subjects
  has_many :enrollments
  has_many :users, through: :enrollments

  def self.search(name, subject)
    courses = Course.all


    courses = courses.where(["name LIKE ?", "%#{name}%"]) if name.present?
    if subject.present?
      the_subject = Subject.find_by(name: "#{subject}")
      course_id = the_subject.course_subjects.select("course_id")
      courses = courses.where("Id IN (?)", course_id)
    end

    return courses
  end
end
