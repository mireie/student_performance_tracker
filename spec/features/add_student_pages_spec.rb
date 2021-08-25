# require 'rails_helper'

# describe "the add a review process" do
#   it "adds a new review" do
#     test_teacher = Teacher.create({:first_name => "Jackie", :last_name => "Chan"})
#     visit teachers_path
#     click_on ("Jackie Chan")
#     click_on ("Add a review")
#     fill_in "Author", :with => "Bob"
#     fill_in "Rating", :with => "5"
#     fill_in "review[content_body]", :with => "It a fast car go vroom vroom vroom vroom vroom vroom vroom vroom."
#     click_on ("Create Review")
#     expect(page).to have_content "Bob"
#   end

  # it "gives an error when no author is entered" do
  #   test_teacher = Teacher.create({:name => "Car", :cost => "15155", :country_of_origin => "Japan"})
  #   visit teachers_path
  #   click_on ("Car")
  #   click_on ("Add a review")
  #   click_on ("Create Review")
  #   expect(page).to have_content "Author can't be blank"
  # end

# end