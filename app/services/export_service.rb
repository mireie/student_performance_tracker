# frozen_string_literal: true

module ExportService
  class << self
    def export_benchmarks
      require "csv"
      dir = "storage/exports"
      FileUtils.mkdir_p(dir)
      Rails.application.eager_load!
      file = Rails.root.join("#{dir}/export-brm-results-#{Time.now.to_i}.csv")
      headers = [
        "student_id",
        "date",
        "measure",
        "score",
        "description",
      ]

      CSV.open(file, "w") do |csv|
        csv << headers
        measures = [:lnf, :snf, :orf_cwpm, :orf_accuracy]
        BenchmarkResult.find_each do |benchmark_result|
          measures.each do |measure|
            details = []
            details << "Student Name: #{benchmark_result.student.student_name}"
            details << "Grade Level: #{benchmark_result.orf_grade_lvl}" if benchmark_result.orf_grade_lvl.presence

            if benchmark_result.send(measure)
              data_to_add = []
              data_to_add << benchmark_result.student_id
              data_to_add << benchmark_result.date.to_s
              data_to_add << measure.to_s
              data_to_add << benchmark_result.send(measure)
              data_to_add << details.join(", ")
              csv << data_to_add
            end
          end
        end
      end
      file
    end
  end
end