require 'rails_helper'

describe "the delete a teacher process" do
  it "deletes a new teacher" do
    test_teacher = Teacher.create({:first_name => "Jackie", :last_name => "Chan"})
    visit teachers_path
    click_on ("Jackie Chan")
    click_link 'Delete Teacher'
    visit teachers_path
    expect(page).to_not have_content "Jackie Chan"
  end

end