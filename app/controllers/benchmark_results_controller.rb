# frozen_string_literal: true

class BenchmarkResultsController < ApplicationController
  before_action :active_user

  def index
    @student = Student.find(params[:student_id])
    @benchmark_results = @student.benchmark_results
    render :index
  end

  def new
    @student = Student.find(params[:student_id])
    @benchmark_result = @student.benchmark_results.new
    render :new
  end

  def create
    @student = Student.find(params[:student_id])
    @benchmark_result = @student.benchmark_results.new(benchmark_result_params)
    if @benchmark_result.save
      flash[:notice] = "Benchmark score successfully added!"
      redirect_to student_path(@student)
    else
      flash[:alert] = @benchmark_result.errors.full_messages.to_sentence
      format.html { render :new }
    end
  end

  def show
    @student = Student.find(params[:student_id])
    @benchmark_result = BenchmarkResult.find(params[:id])
    render :show
  end

  def edit
    @student = Student.find(params[:student_id])
    @benchmark_result = BenchmarkResult.find(params[:id])
    render :edit
  end

  def update
    @benchmark_result = BenchmarkResult.find(params[:id])
    if @benchmark_result.update(benchmark_result_params)
      flash[:notice] = "Benchmark score successfully updated!"
      redirect_to student_benchmark_results_path(@benchmark_result.student)
    else
      @student = Student.find(params[:student_id])
      render :edit
    end
  end

  def destroy
    @benchmark_result = BenchmarkResult.find(params[:id])
    @benchmark_result.destroy
    flash[:notice] = "Benchmark score successfully deleted!"
    redirect_to student_path(@benchmark_result.student)
  end

  private

  def benchmark_result_params
    params.require(:benchmark_result).permit(
      :date,
      :ge,
      :vocab_ge,
      :reading_comp_ge,
      :lnf,
      :snf,
      :orf_grade_lvl,
      :orf_cwpm,
      :orf_accuracy,
      :orf_instructional_grade_lvl,
      :orf_instructional_cwpm,
      :orf_instructional_accuracy,
      :sight_word_ge,
      :phonemic_decoding_ge,
      :elison_ge,
      :blending_ge,
      :isolation_ge
    )
  end
end
