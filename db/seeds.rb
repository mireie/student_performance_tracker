[Teacher, Student, BenchmarkResult, Progress].each do |c|
  c.destroy_all
end

class Seed
  def self.begin
    puts "Cleaning up after the last mess, please wait a moment..."

    seed = Seed.new
    seed.generate_teachers
    seed.generate_students
    seed.generate_benchmark_results
    seed.generate_progresses
  end

  def generate_teachers
    puts "Generating Teachers."
    25.times do |i|
      Teacher.create!(
        first_name: Faker::Creature::Dog.name,
        last_name: Faker::Creature::Cat.name,
      )
      print "."
    end
    puts "\n"
  end

  def generate_students
    puts "Generating Students."
    250.times do |k|
      Student.create!(
        first_name: Faker::Creature::Dog.name,
        last_name: Faker::Creature::Cat.name,
      )
      print "."
    end
    puts "\n"
  end

  def generate_benchmark_results
    Student.all.each do |s|
      BenchmarkResult.create!(

      )
    end
  end

  def generate_progresses
    Student.all.each do |s|
      Progress.create!(
        
      )
    end
  end
end
