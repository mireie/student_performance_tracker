# frozen_string_literal: true

require 'rails_helper'

describe "the edit a teacher process" do
  it "edits a teacher" do
    Teacher.create({:first_name => "Jackie", :last_name => "Chan"})
    visit teachers_path
    click_on ("Chan, Jackie")
    click_on 'Edit teacher'
    fill_in "teacher[first_name]", :with => "Bob"
    fill_in "teacher[last_name]", :with => "Marley"
    click_on 'Update Teacher'
    visit teachers_path
    expect(page).to have_content "Marley, Bob"
  end
end