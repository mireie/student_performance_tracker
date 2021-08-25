require 'rails_helper'

describe "the edit a teacher process" do
  it "edits a teacher" do
    test_teacher = Teacher.create({:first_name => "Jackie", :last_name => "Chan"})
    visit teachers_path
    click_on ("Jackie Chan")
    click_on 'Edit teacher'
    fill_in "teacher[first_name]", :with => "Bob"
    fill_in "teacher[last_name]", :with => "Marley"
    click_on 'Update Teacher'
    visit teachers_path
    expect(page).to have_content "Bob Marley"
  end
end