class FacultiesController < ApplicationController
    before_action :set_faculty, only: [:show, :edit, :update, :destroy]
    def index
        @faculties = Faculty.all
    end

    def new
        @faculty = Faculty.new
    end

    def create
      @faculty = Faculty.new(faculty_params)
      if @faculty.save
        flash[:notice] = "Faculty details was Added successfully."
        redirect_to faculty_path(@faculty)
      else
        render 'new'
      end
    end

    def show
    end

    def edit
    end

    def update
        if @faculty.update(faculty_params)
            flash[:notice] = "Faculty updated successfully."
            redirect_to @faculty
        else
            render 'edit'
        end
    end

    def destroy
        @faculty.destroy
        redirect_to faculties_path
    end

    private
    def set_faculty
        @faculty = Faculty.find(params[:id])
    end

    def faculty_params
        params.require(:faculty).permit(:first_name,:last_name,:date_of_birth,:phone_number,:email,:designation)
    end
end
