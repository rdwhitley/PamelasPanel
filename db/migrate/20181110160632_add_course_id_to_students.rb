class AddCourseIdToStudents < ActiveRecord::Migration[5.2]
  def change
  	add_column :students, :cohort_id, :integer
  end
end
