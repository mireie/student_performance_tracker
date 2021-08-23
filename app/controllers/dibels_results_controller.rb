class DibelsResultsController < ApplicationController

    def new
      @student = Student.find(params[:student_id])
      @dibels_result = @student.dibels_results.new
      render :new
    end
  
    def create
      @student = Student.find(params[:student_id])
      @dibels_result = @student.dibels_results.new(dibels_result_params)
      if @dibels_result.save
        flash[:notice] = "Dibels Result successfully added!"
        redirect_to student_path(@student)
      else
        render :new
      end
    end
  
    def show
      @student = Student.find(params[:student_id])
      @dibels_result = DibelsResult.find(params[:id])
      render :show
    end
  
    def edit
      @student = Student.find(params[:student_id])
      @dibels_result = DibelsResult.find(params[:id])
      render :edit
    end
  
    def update
      @dibels_result = DibelsResult.find(params[:id])
      if @dibels_result.update(dibels_result_params)
        flash[:notice] = "Dibels Result successfully updated!"
        redirect_to student_path(@dibels_result.student)
      else
        @student = Student.find(params[:student_id])
        render :edit
      end
    end
  
    def destroy
      @dibels_result = DibelsResult.find(params[:id])
      @dibels_result.destroy
      flash[:notice] = "Dibels Result successfully deleted!"
      redirect_to student_path(@dibels_result.student)
    end
  
    private
      def dibels_result_params
        params.require(:dibels_result).permit()
      end
  
end
