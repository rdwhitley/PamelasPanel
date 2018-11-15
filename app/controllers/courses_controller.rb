class CoursesController < ApplicationController
	def edit
		@course = Course.find(params[:id])
	end

	def change
     @course = Course.find(params[:id])
     @course.update(
      name: params[:course][:name], 
      hours: params[:course][:hours]
      )

    redirect_to "/"

  end

  def remove
    Course.destroy(params[:id])

    redirect_to "/"
  end

  def create

  end

  def created
    course = Course.new(course_params)
    if course.save
      redirect_to "/"
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :hours)
  end
end
