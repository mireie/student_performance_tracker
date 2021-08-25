# MVP
* Models (Tests, Users (Admin/Teacher), Students)
* Users // Any admin/teacher can add/read a student
  * Admin (CRUD)
  * Teacher (CR)
* 4 Tests
  * 3 top = quarterly // color code this to make it more visible?
  * 1 bottom-left = biweekly
* Views
  * Student Single Display

# MVP (Finished)
* Quarterly test tables
* DIBELS test tables
* Student tables


# Flex
* Admin to add a new test suite
* Add date range, trend line to graph
* Add middle name to students? ID? (to make them unique in the database)
* Update date entry within quarterlies to a drop-down selection
* Update table to look like THIS: https://examples.bootstrap-table.com/index.html?bootstrap5

https://cdn.discordapp.com/attachments/869663850100846603/877695496938987540/Image_8-17-21_at_10.17_PM.JPG 
https://chartkick.com/
https://shortcake.com/

input form
display view of score
students have many tests



Co-authored-by: Andrew Giang <giang184@gmail.com>
Co-authored-by: Kristen Hopper <hopperdavis@gmail.com>
Co-authored-by: Arthur Lee <meleearthur@gmail.com>
Co-authored-by: Dave Lindqvist <lindqvist.dave@gmail.com>




<%= form_with(model: @teachers, local: true) do |form| %>
<div class="actions">
    <%= form.label "Add a Student"%>
    <%= form.collection_select :teacher_id, @teachers, :id, :full_name%>
    <%= form.submit %>
  </div>
  <% end %>

  <%= form_with(model: @teacher, local: true) do |form| %>
<div class="actions">
    <%= form.label "Add a Student"%>
    <%= form.collection_select :student, Student.all, :id, :student_name%>
    <K>
    <%= form.submit %>
  </div>
  <% end %>

  <%= form_with(model: @teacher, local: true) do |form| %>
<div class="actions">
    <%= form.label "Add a Student"%>
    <%= form.collection_select(:student_ids, Student.all, :id, :student_name, { :multiple => true }) %>
    <%= form.submit %>
  </div>
  <% end %>

  <% if @teacher.students.any? %>

<div class="table-responseive">
  <table class="table table-striped mt-3">
    <thead>
      <tr>
        <th scope="col">Student</th>
        <th scope="col">Last Benchmark</th>
        <th scope="col">Last Progress Check</th>
        <th scope="col">Average Progress DIBELS</th>
        <th scope="col">Average Progress Accuracy</th>
      </tr>
    </thead>
    <tbody>
      <% @teacher.students.order(:last_name).each do |student| %>
        <tr>
          <th scope="row" class="grid-col-1"><%= link_to "#{student.last_name}, #{student.first_name}", student_path(student)%></th>
          <td><%= student.last_benchmark_date%></td>
          <td><%= student.last_progress_date%></td>
          <td><%= student.avg_progress_dibels%></td>
          <td><%= student.avg_progress_accuracy %></td>
        </tr>
      <% end %>
    </tbody>
  </table>
</div>
<% else %>
  <p>There are no students assigned to this teacher</p>
<% end %>