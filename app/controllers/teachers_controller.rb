# frozen_string_literal: true

class TeachersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_teacher, only: %i[ show edit update destroy ]
  before_action :active_user, only: [:index, :show]
  before_action :authorize_admin, only: [:edit, :inactive, :destroy, :new, :create]

  # GET /teachers or /teachers.json
  def index
    @teachers = Teacher.is_active.page(params[:page]).per(50)
    render :index
  end

  def inactive
    @teachers = Teacher.not_active.page(params[:page]).per(50)
    render :inactive
  end

  # GET /teachers/1 or /teachers/1.json
  def show
    @teacher = Teacher.find(params[:id])
    @students = @teacher.students.page(params[:page])
    @all_students = Student.all
    render :show
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
    render :new
  end

  # GET /teachers/1/edit
  def edit
    @teacher = Teacher.find(params[:id])
    render :edit
  end

  # POST /teachers or /teachers.json
  def create
    @teacher = Teacher.new(teacher_params)

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to @teacher, notice: "Teacher was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/1 or /teachers/1.json
  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to @teacher, notice: "Teacher was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1 or /teachers/1.json
  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: "Teacher was successfully removed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def teacher_params
    # params.fetch(:teacher, {})
    params.require(:teacher).permit(:first_name, :last_name, :active)
  end

end
