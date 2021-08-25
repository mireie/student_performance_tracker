class ChartsController < ApplicationController
  def index
    @student = Student.first
    # @student = Student.create(:first_name => "Bob", :last_name => "Burger", :teacher_id => Teacher.all[0].id, :dob => "10-1-2000")
    # Progress.create!(:date => "1-10-2019", :grade => 2, :dibels => 85, :accuracy => 0.89, :student_id => @student.id)
    # Progress.create!(:date => "1-11-2019", :grade => 2, :dibels => 79, :accuracy => 0.9, :student_id => @student.id)
    # Progress.create!(:date => "1-12-2019", :grade => 2, :dibels => 69, :accuracy => 0.97, :student_id => @student.id)
    # Progress.create!(:date => "15-01-2020", :grade => 2, :dibels => 78, :accuracy => 0.88, :student_id => @student.id)
    # Progress.create!(:date => "01-2-2020", :grade => 2, :dibels => 98, :accuracy => 0.95, :student_id => @student.id)
    # Progress.create!(:date => "15-02-2020", :grade => 2, :dibels => 121, :accuracy => 0.96, :student_id => @student.id)
    # Progress.create!(:date => "15-10-2020", :grade => 3, :dibels => 63, :accuracy => 0.91, :student_id => @student.id)
    # Progress.create!(:date => "1-11-2020", :grade => 3, :dibels => 65, :accuracy => 0.87, :student_id => @student.id)
    # Progress.create!(:date => "15-11-2020", :grade => 3, :dibels => 52, :accuracy => 0.88, :student_id => @student.id)
    # Progress.create!(:date => "1-12-2020", :grade => 3, :dibels => 65, :accuracy => 0.93, :student_id => @student.id)
    # Progress.create!(:date => "15-12-2020", :grade => 3, :dibels => 53, :accuracy => 0.91, :student_id => @student.id)
    # Progress.create!(:date => "1-4-2021", :grade => 3, :dibels => 157, :accuracy => 0.99, :student_id => @student.id)
    # Progress.create!(:date => "15-04-2021", :grade => 3, :dibels => 99, :accuracy => 0.95, :student_id => @student.id)
    # Progress.create!(:date => "01-5-2021", :grade => 3, :dibels => 68, :accuracy => 0.94, :student_id => @student.id)
    # Progress.create!(:date => "15-05-2021", :grade => 3, :dibels => 147, :accuracy => 0.97, :student_id => @student.id)

    @progresses = @student.progresses
    @benchmark_results = @student.benchmark_results
    render :index
  end
end

# @student = Student.find(1)
# @progresses = @student.progresses
# <%= line_chart User.group_by_day(:created_at).count %>
# <%= line_chart @progresses.group_by_day(:date).dibels %>
