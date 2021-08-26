class StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student, only: %i[ show edit update destroy ]
  before_action :active_user, only: [:index, :show, :inactive, :update, :new, :edit, :create]
  before_action :authorize_admin, only: [:destroy]

  # GET /students or /students.json
  def index
    @students = Student.is_active.page(params[:page]).per(50)
    @teachers = Teacher.all
    render :index
  end

  def inactive
    @students = Student.not_active.page(params[:page]).per(50)
    @teachers = Teacher.all
    render :inactive
  end

  # GET /students/1 or /students/1.json
  def show
    @student = Student.find(params[:id])
    @teacher = Teacher.find(@student.teacher_id)
    render :show
  end

  # GET /students/new
  def new
    @student = Student.new
    @teachers = Teacher.all
    render :new
  end

  # GET /students/1/edit
  def edit
    @teachers = Teacher.all
  end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)
    @teachers = Teacher.all
    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: "Student was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: "Student was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: "Student was successfully removed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
    # @teacher = Teacher.find(params[:teacher_id])   #if we need this later
  end

  # Only allow a list of trusted parameters through.
  def student_params
    # params.fetch(:student, {})
    params.require(:student).permit(:first_name, :last_name, :teacher_id, :active)
  end

end
