class CohortsController < ApplicationController
	def edit
		@cohort = Cohort.find(params[:id])
		print @cohort
	end

	def change
		@cohort = Cohort.find(params[:id])

		@cohort.update(
			name: params[:cohort][:name], 
		 	start_date: params[:cohort][:start_date],
		 	end_date: params[:cohort][:end_date],
		 course_id: params[:cohort][:course_id],
		 	instructor_id: params[:cohort][:instructor_id]
		)


		redirect_to "/"
	end

	def remove
		Cohort.destroy(params[:id])

		redirect_to "/"
	end

	def create

  	end

  	def created
	    cohort = Cohort.new(cohort_params)
	    if cohort.save
	      redirect_to "/"
	    end
  	end

  private

  def cohort_params
    params.require(:cohort).permit(:name, :start_date, :end_date, :course_id, :instructor_id)
  end


end
