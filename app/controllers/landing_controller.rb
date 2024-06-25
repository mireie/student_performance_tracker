# frozen_string_literal: true

class LandingController < ApplicationController
  def index
    @teachers = Teacher.where(:active => true)
    @students = Student.where(:active => true)
    @inactive_users = User.where(:active => false)
    @users = User.where(:active => true)
  end
end
