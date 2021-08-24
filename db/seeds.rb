binding.pry
Teacher.destroy_all
Student.destroy_all
5.times do |i|
  teacher = Teacher.create!(
    first_name: Faker::Creature::Dog.name,
    last_name: Faker::Creature::Cat.name
  )
  puts "Teacher #{i}: Name is #{teacher.first_name}, #{teacher.last_name}."
  20.times do |k|
    student = Student.create!(
      first_name: Faker::Creature::Dog.name,
      last_name: Faker::Creature::Cat.name,
      teacher_id: teacher.id
    )
    puts "Student #{k}: Name is #{student.first_name}, #{student.last_name}."
  end
end
