require 'rails_helper'

describe "the delete a student " do
  it "deletes a student" do
    Teacher.create({:first_name => "Jackie", :last_name => "Chan"})
    visit students_path
    click_on ("New Student")
    fill_in "student[first_name]", :with => "Jack"
    fill_in "student[last_name]", :with => "Ma"
    select("Jackie Chan", from: 'student[teacher_id]')
    click_on ("Create Student")
    click_on ("Delete Student")
    expect(page).to have_content "Student was successfully removed"
    visit students_path
    expect(page).to_not have_content "Jack Ma"
  end
end