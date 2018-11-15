class StudentsController < ApplicationController
  def destroy
    puts "New Student Logout"
  end

  def edit
  	@student = Student.find(params[:id])
  end

  def change
     @student = Student.find(params[:id])
     @student.update(
      fname: params[:student][:fname], 
      lname: params[:student][:lname],
      age: params[:student][:age],
      email: params[:student][:email],
      cohort_id: params[:student][:cohort_id],
      )

    redirect_to "/"

  end

  def remove
    Student.destroy(params[:id])

    redirect_to "/"
  end

  def create

  end

  def created
    puts 'this are the student params #{student_params}'
    student = Student.new(student_params)
    if student.save
      redirect_to "/"
    end
  end

  private

  def student_params
    params.require(:student).permit(:fname, :lname, :age, :email, :cohort_id, :password, :password_confirmation)
  end



end
