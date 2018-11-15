class InstructorsController < ApplicationController
	def edit
		@instructor = Instructor.find(params[:id])
	end

	def update
		@instructor = Instructor.find(params[:id])
		 @instructor.update(
		 	fname: params[:instructor][:fname], 
		 	lname: params[:instructor][:lname],
		 	salary: params[:instructor][:salary],
		 	age: params[:instructor][:age],
		 	email: params[:instructor][:email],
		 	admin: params[:instructor][:admin],
		 	)
		

		redirect_to "/"
	end

	def remove
		Instructor.destroy(params[:id])

		redirect_to "/"
	end

	def create

  	end

  def created
  	puts params
    instructor = Instructor.new(instructor_params)
    if instructor.save
      redirect_to "/"
    end
  end

  private

  def instructor_params
    params.require(:instructor).permit(:admin,:fname, :lname, :age, :email, :salary, :password, :password_confirmation)
  end
	
end
