class ChangeEnrollments < ActiveRecord::Migration[5.0]
  def change
    rename_column :enrollments, :courses_id, :course_id
  end
end
