class Seed
  def self.begin
    puts "Cleaning up after the last mess, please wait a moment..."

    [Teacher, Student, BenchmarkResult, Progress].each do |c|
      c.destroy_all
    end
    puts "Done!"
    seed = Seed.new
    seed.generate_teachers
    seed.generate_students
    seed.generate_benchmark_results
    seed.generate_progresses

    puts "\nSeed Complete! Generated #{Teacher.all.size} Teachers, #{Student.all.size} Students, #{BenchmarkResult.all.size} Benchmark Results, and #{Progress.all.size} Progress Results."
  end

  def generate_teachers
    puts "Generating Teachers:"
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
    puts "Generating Students:"
    counter = 0
    250.times do |k|
      teacher = Teacher.order("RANDOM()").first
      Student.create!(
        first_name: Faker::Creature::Dog.name,
        last_name: Faker::Creature::Cat.name,
        teacher_id: teacher.id,
      )
      if counter % 25 === 0
        print "."
        counter += 1
      else
        counter += 1
      end
    end
    puts "\n"
  end

  def generate_benchmark_results
    puts "Generating Benchmark Results:\n"
    Student.all.each do |s|
      rand(12).times do
        BenchmarkResult.create!(
          date: Faker::Date.backward(days: 1460),
          ge: rand(5) + rand(),
          vocab_ge: rand(5) + rand(),
          reading_comp_ge: rand(5) + rand(),
          lnf: rand(100),
          snf: rand(100),
          orf_grade_lvl: rand(12),
          orf_cwpm: rand(250),
          orf_accuracy: rand(),
          student_id: s.id,
        )
      end
      print "."
    end
    puts "\n"
  end

  def generate_progresses
    puts "Generating Progress Results:\n"
    Student.all.each do |s|
      rand(48).times do
        Progress.create!(
          date: Faker::Date.backward(days: 365),
          grade: rand(12),
          dibels: rand(12),
          accuracy: rand(),
          student_id: s.id,
        )
      end
      print "."
    end
  end

  puts "\n"
end

Seed.begin
