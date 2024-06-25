# frozen_string_literal: true

require 'rails_helper'

describe "the add teacher process" do
  it "adds a new teacher" do
    visit teachers_path
    click_on 'New Teacher'
    fill_in 'teacher[first_name]', :with => 'Bob'
    fill_in 'teacher[last_name]', :with => 'Marley'
    click_on 'Create Teacher'
    expect(page).to have_content 'Teacher was successfully created.'
    visit teachers_path
    expect(page).to have_content 'Marley, Bob'
  end
  
  it "gives an error when no name is entered" do
    visit teachers_path
    click_on 'New Teacher'
    click_on 'Create Teacher'
    expect(page).to have_content "First name can't be blank"
    expect(page).to have_content "Last name can't be blank"

  end
end