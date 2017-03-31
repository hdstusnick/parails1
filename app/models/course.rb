class Course < ApplicationRecord
  has_many :courses_subjects
  has_many :subjects, through: :courses_subjects
  has_many :enrollments
  has_many :users, through: :enrollments
end
