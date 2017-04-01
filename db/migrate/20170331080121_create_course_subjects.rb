class CreateCourseSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :course_subjects do |t|
      t.belongs_to :course, index: true, foreign_key: true
      t.belongs_to :subject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
