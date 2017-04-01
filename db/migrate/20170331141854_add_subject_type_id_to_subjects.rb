class AddSubjectTypeIdToSubjects < ActiveRecord::Migration[5.0]
  def change
    add_column :subjects, :subject_type_id, :string
  end
end
