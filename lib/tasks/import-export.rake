require "csv"

namespace :db do
  desc "Import Students"

  task :import_students => :environment do
    puts "Deleting Empty Imports"
    i_t = Teacher.where(:first_name => "Import")
    i_t_count = 0
    i_t.each do |it|
      if it.students.size === 0
        it.destroy
        i_t_count += 1
      end
    end
    puts "Import Teachers deleted: #{i_t_count}"
    filename = "app/import/test-student-import.csv"
    counter = 0
    t = Time.now.to_s
    teacher_hash = { :first_name => "Import", :last_name => t }
    Teacher.create!(teacher_hash)
    puts "Importing Students for Teacher id: #{Teacher.where(:last_name => t).first.id}"
    CSV.foreach(filename, headers: true) do |row|
      import_hash = row.to_hash
      import_hash[:teacher_id] = Teacher.where(:last_name => t).first.id
      Student.create!(import_hash)
      counter += 1
    end
    puts "Students Created: #{counter}"
  end
  task :import_benchmarks => :environment do
    filename = "app/import/test-benchmark-results-import.csv"
    counter = 0
    puts "Importing Benchmark Scores"
    CSV.foreach(filename, headers: true) do |row|
      import_hash = row.to_hash
      BenchmarkResult.create!(import_hash)
      counter += 1
    end
    puts "Benchmark Scores Created: #{counter}"
  end
  task :import_progresses => :environment do
    filename = "app/import/test-progresses-import.csv"
    counter = 0
    puts "Importing Progress Scores"
    CSV.foreach(filename, headers: true) do |row|
      import_hash = row.to_hash
      Progress.create!(import_hash)
      counter += 1
    end
    puts "Progress Scores Created: #{counter}"
  end
  task :export_students => :environment do
    Rails.application.eager_load!
    file = Rails.root.join("tmp/export/export-#{Time.now.to_i}.csv")

    CSV.open(file, "w") do |csv|
      csv << Student.attribute_names
      Student.find_each do |student|
        csv << student.attributes.values
      end
    end
    puts "Exported CSV"
  end
end
