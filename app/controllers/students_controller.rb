class StudentsController < ApplicationController
    before_action :set_student, only: [:show, :edit, :update, :destroy]
    def index
        @students = Student.all
    end

    def new
        @student = Student.new
    end

    def create
      @student = Student.new(student_params)
      if @student.save
        flash[:notice] = "Student details was Added successfully."
        redirect_to student_path(@student)
      else
        render 'new'
      end
    end

    def show
    end

    def edit 
    end

    def update
        if @student.update(student_params)
            flash[:notice] = "Student updated successfully."
            redirect_to @student
        else
            render 'edit'
        end
    end

    def destroy
        @student.destroy
        redirect_to students_path
    end

    private

    def set_student
        @student = Student.find(params[:id])
    end

    def student_params
        params.require(:student).permit(:first_name,:last_name,:date_of_birth,:department,:terms_of_usage)
    end
end
