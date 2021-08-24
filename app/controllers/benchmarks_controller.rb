class BenchmarksController < ApplicationController

  def index
    @student = Student.find(params[:student_id])
    @benchmarks = @student.benchmarks
    
    render:index
  end

  def new
    @student = Student.find(params[:student_id])
    @benchmark = @student.benchmarks.new
    render :new
  end

  def create
    @student = Student.find(params[:student_id])
    @benchmark = @student.benchmarks.new(benchmark_params)
    if @benchmark.save
      flash[:notice] = "Benchmark score successfully added!"
      redirect_to student_path(@student)
    else
      render :new
    end
  end

  def show
    @student = Student.find(params[:student_id])
    @benchmark = Benchmark.find(params[:id])
    render :show
  end

  def edit
    @student = Student.find(params[:student_id])
    @benchmark = Benchmark.find(params[:id])
    render :edit
  end

  def update
    @benchmark = Benchmark.find(params[:id])
    if @benchmark.update(benchmark_params)
      flash[:notice] = "Benchmark score successfully updated!"
      redirect_to student_benchmark_path(@benchmark.student)
    else
      @student = Student.find(params[:student_id])
      render :edit
    end
  end

  def destroy
    @benchmark = Benchmark.find(params[:id])
    @benchmark.destroy
    flash[:notice] = "Benchmark score successfully deleted!"
    redirect_to student_path(@benchmark.student)
  end

  private
    def benchmark_params
      params.require(:benchmark).permit(:date, :ge, :vocab_ge, :reading_comp_ge, :lnf, :snf, :orf_grade_lvl, :orf_cwpm, :orf_accuracy)
    end
end
