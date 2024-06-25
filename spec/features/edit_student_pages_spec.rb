# frozen_string_literal: true

require 'rails_helper'

describe "the edit a student process" do
  it "edits a new student" do
    Teacher.create({:first_name => "Jackie", :last_name => "Chan"})
    Teacher.create({:first_name => "Diddy", :last_name => "Kong"})
    visit students_path
    click_on ("New Student")
    fill_in "student[first_name]", :with => "Jack"
    fill_in "student[last_name]", :with => "Ma"
    select("Jackie Chan", from: 'student[teacher_id]')
    click_on ("Create Student")
    click_on ("Edit Student")
    fill_in "student[first_name]", :with => "Tristam"
    fill_in "student[last_name]", :with => "Remi"
    select("Diddy Kong", from: 'student[teacher_id]')
    click_on ("Update Student")
    expect(page).to have_content "Teacher: Diddy Kong"
    expect(page).to have_content "Tristam Remi"
  end
end