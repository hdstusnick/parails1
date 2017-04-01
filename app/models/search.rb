class Search < ApplicationRecord


  def courses
    @courses = find_courses
  end

  private

    def find_courses
      courses = Course.order(:name)

      courses = courses.where(["name LIKE ?", "%#{keywords}%"]) if keywords.present?
      if subject.present?
        subjects = Subject.find()
      end
      courses = courses.where(["code LIKE ?", code]) if code.present?

      return courses
    end
end
