class Subject < ApplicationRecord
  has_many :courses_subjects
  has_many :courses, through: :courses_subjects
end
