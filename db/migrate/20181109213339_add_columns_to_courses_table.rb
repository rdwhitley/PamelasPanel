class AddColumnsToCoursesTable < ActiveRecord::Migration[5.2]
  def change
  	add_column :courses, :name, :string
  	add_column :courses, :hours, :integer
  	add_column :courses, :course_id, :integer
  end
end
