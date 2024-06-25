# frozen_string_literal: true

require 'rails_helper'

describe "the add a student process" do
  it "adds a new student" do
    Teacher.create({:first_name => "Jackie", :last_name => "Chan"})
    visit students_path
    click_on ("New Student")
    fill_in "student[first_name]", :with => "Jack"
    fill_in "student[last_name]", :with => "Ma"
    select("Jackie Chan", from: 'student[teacher_id]')
    click_on ("Create Student")
    expect(page).to have_content "Jack Ma"
    expect(page).to have_content "Teacher: Jackie Chan"

  end

it "gives an error when no student is entered" do
  visit students_path
  click_on ("New Student")
  click_on ("Create Student")
  expect(page).to have_content "First name can't be blank"
  expect(page).to have_content "Last name can't be blank"

  end
end