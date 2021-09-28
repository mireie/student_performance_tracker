class LandingController < ApplicationController
  def index
    @teachers = Teacher.where(:active => true)
  end
end