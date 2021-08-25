require 'rails_helper'

describe "the add a progress process" do
  it "adds a new progress" do
    Teacher.create({:first_name => "Jackie", :last_name => "Chan"})
    visit students_path
    click_on ("New Student")
    fill_in "student[first_name]", :with => "Jack"
    fill_in "student[last_name]", :with => "Ma"
    select("Jackie Chan", from: 'student[teacher_id]')
    click_on ("Create Student")
    click_on ("Add Progress")
    fill_in "Date", :with => "09/03/1999"
    fill_in "Grade", :with => "6"
    fill_in "DIBELS", :with => "10"
    fill_in "Accuracy", :with => "1"
    click_on ("Create Progress")
    expect(page).to have_content "1999-09-03"
    expect(page).to have_content "6"
    expect(page).to have_content "10"
    expect(page).to have_content "1"
  end

  # it "gives an error when no student is entered" do
  #   Teacher.create({:first_name => "Jackie", :last_name => "Chan"})
  #   visit students_path
  #   click_on ("New Student")
  #   fill_in "student[first_name]", :with => "Jack"
  #   fill_in "student[last_name]", :with => "Ma"
  #   select("Jackie Chan", from: 'student[teacher_id]')
  #   click_on ("Create Student")
  #   click_on ("Add Progress")
  #   click_on ("Create Progress")
  #   expect(page).to have_content "1999-09-03"
  #   expect(page).to have_content "1999-09-03"
  #   expect(page).to have_content "1999-09-03"
  # end
end