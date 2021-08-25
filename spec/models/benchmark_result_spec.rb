require "rails_helper"

describe BenchmarkResult do
  it { should allow_value(1).for(:date) }
  it { should allow_value(1.1).for(:ge) }
  it { should_not allow_value("string").for(:ge) }
  it { should allow_value(1.1).for(:vocab_ge) }
  it { should_not allow_value("string").for(:vocab_ge) }
  it { should allow_value(1.1).for(:reading_comp_ge) }
  it { should_not allow_value("string").for(:reading_comp_ge) }
  it { should allow_value(1).for(:lnf) }
  it { should_not allow_value("string").for(:lnf) }
  it { should allow_value(25).for(:snf) }
  it { should_not allow_value("string").for(:snf) }
  it { should allow_value(25).for(:orf_grade_lvl) }
  it { should_not allow_value("string").for(:orf_grade_lvl) }
  it { should allow_value(25).for(:orf_cwpm) }
  it { should_not allow_value("string").for(:orf_cwpm) }
  it { should allow_value(25).for(:orf_accuracy) }
  it { should_not allow_value("string").for(:orf_accuracy) }
  it { should allow_value(25).for(:student_id) }
end

# RSpec.describe UserProfile, type: :model do
#   it { should allow_value('https://foo.com').for(:website_url) }
#   it { should allow_value('https://bar.com').for(:website_url) }
# end
