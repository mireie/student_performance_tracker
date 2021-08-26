class Seed
  def self.begin
    puts "Cleaning up after the last mess, please wait a moment..."

    [Teacher, Student, BenchmarkResult, Progress, User].each do |c|
      c.destroy_all
    end
    puts "Done!"
    seed = Seed.new
    seed.generate_teachers
    seed.generate_students
    seed.generate_benchmark_results
    seed.generate_progresses
    seed.generate_users

    puts "\nSeed Complete! Generated #{Teacher.all.size} Teachers, #{Student.all.size} Students, #{BenchmarkResult.all.size} Benchmark Results, and #{Progress.all.size} Progress Results."
  end

  def generate_teachers
    puts "Generating Teachers:"
    25.times do |i|
      Teacher.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name 
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
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name, 
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
          ge: rand(5) + rand().round(2),
          vocab_ge: rand(5) + rand().round(2),
          reading_comp_ge: rand(5) + rand().round(2),
          lnf: rand(100),
          snf: rand(100),
          orf_grade_lvl: rand(12),
          orf_cwpm: rand(200),
          orf_accuracy: rand(70..100).round(2),
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
          dibels: rand(50..200),
          accuracy: rand(70..100).round(2),
          student_id: s.id,
        )
      end
      print "."
    end
  end

  puts "\n"

  def generate_users
    puts "Generating User Accounts \n"
    User.create!(:email => "admin@example.com", :password => "password", :admin => true, :active => true)
    User.create!(:email => "teacher@example.com", :password => "password", :admin => false, :active => true)
    puts "Generated accounts: \033[103;30;51madmin@example.com, teacher@example.com\033[0m with password \033[103;30;51mpassword\033[0m \n"
    
  end
end

Seed.begin
