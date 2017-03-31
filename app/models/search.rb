class Search < ApplicationRecord

  def courses
    @products = find_courses
  end

  private

    def find_courses
      courses = Course.order(:name)

      courses = courses.where(["name LIKE ?", "%#{keywords}%"]) if keywords.present?
      courses = courses.where(["code LIKE ?", code]) if code.present?

      return courses
    end
end
