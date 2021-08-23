class QuarterlyResultsController < ApplicationController

  def index
    @student = Student.find(params[:student_id])
    @quarterly_results = @student.quarterly_results
    
    render:index
  end

  def new
    @student = Student.find(params[:student_id])
    @quarterly_result = @student.quarterly_results.new
    render :new
  end

  def create
    @student = Student.find(params[:student_id])
    @quarterly_result = @student.quarterly_results.new(quarterly_result_params)
    if @quarterly_result.save
      flash[:notice] = "Quarterly Result successfully added!"
      redirect_to student_path(@student)
    else
      render :new
    end
  end

  def show
    @student = Student.find(params[:student_id])
    @quarterly_result = QuarterlyResult.find(params[:id])
    render :show
  end

  def edit
    @student = Student.find(params[:student_id])
    @quarterly_result = QuarterlyResult.find(params[:id])
    render :edit
  end

  def update
    @quarterly_result = QuarterlyResult.find(params[:id])
    if @quarterly_result.update(quarterly_result_params)
      flash[:notice] = "Quarterly Result successfully updated!"
      redirect_to student_quarterly_results_path(@quarterly_result.student)
    else
      @student = Student.find(params[:student_id])
      render :edit
    end
  end

  def destroy
    @quarterly_result = QuarterlyResult.find(params[:id])
    @quarterly_result.destroy
    flash[:notice] = "Quarterly Result successfully deleted!"
    redirect_to student_path(@quarterly_result.student)
  end

  private
    def quarterly_result_params
      params.require(:quarterly_result).permit(:date, :ge, :vocab_ge, :reading_comp_ge, :lnf, :snf, :nwf_cls, :nwf_wrc, :wrf, :orf_grade_lvl, :orf_cwpm, :orf_accuracy)
    end
end
