require 'rails_helper'

describe "the add teacher process" do
  it "adds a new teacher" do
    visit teachers_path
    click_on 'New Teacher'
    fill_in 'teacher[first_name]', :with => 'Bob'
    fill_in 'teacher[last_name]', :with => 'Marley'
    click_on 'Create Teacher'
    expect(page).to have_content 'Teacher successfully created!'
  end
  
  it "gives an error when no name is entered" do
    visit new_teacher_path
    click_on 'Create teacher'
    expect(page).to have_content "Name can't be blank"
  end
end