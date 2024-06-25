# frozen_string_literal: true

class ProgressesController < ApplicationController
  before_action :active_user

  def index
    @student = Student.find(params[:student_id])
    @progresses = @student.progresses
    render :index
  end

  def new
    @student = Student.find(params[:student_id])
    @progress = @student.progresses.new
    render :new
  end

  def create
    @student = Student.find(params[:student_id])
    @progress = @student.progresses.new(progress_params)
    respond_to do |format|
      if @progress.save
        format.html { redirect_to @student, notice: "Progress Score was successfully created." }
      else
        flash[:alert] = @progress.errors.full_messages.to_sentence
        format.html { render :new }
      end
    end
  end

  def show
    @student = Student.find(params[:student_id])
    @progress = Progress.find(params[:id])
    render :show
  end

  def edit
    @student = Student.find(params[:student_id])
    @progress = Progress.find(params[:id])
    render :edit
  end

  def update
    @progress = Progress.find(params[:id])
    if @progress.update(progress_params)
      flash[:notice] = "DIBELS score successfully updated!"
      redirect_to student_progresses_path(@progress.student)
    else
      flash[:alert] = @progress.errors.full_messages.to_sentence
      @student = Student.find(params[:student_id])
      render :edit
    end
  end

  def destroy
    @progress = Progress.find(params[:id])
    @progress.destroy
    flash[:notice] = "DIBELS score successfully deleted!"
    redirect_to student_path(@progress.student)
  end

  private
    def progress_params
      params.require(:progress).permit(:date, :grade, :dibels, :accuracy)
    end

end
