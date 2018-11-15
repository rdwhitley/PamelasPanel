class AddColumnsToInstructorsTable < ActiveRecord::Migration[5.2]
  def change
  	add_column :instructors, :fname, :string
  	add_column :instructors, :lname, :string
  	add_column :instructors, :salary, :integer
  	add_column :instructors, :age, :integer
  end
end
