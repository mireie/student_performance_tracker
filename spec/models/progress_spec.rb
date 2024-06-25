# frozen_string_literal: true

require "rails_helper"

describe Progress do
  it { should allow_value(5).for(:date) }
  it { should_not allow_value("string").for(:date) }
  it { should allow_value(5).for(:grade) }
  it { should_not allow_value("string").for(:grade) }
  it { should allow_value(5).for(:dibels) }
  it { should_not allow_value("string").for(:dibels) }
  it { should allow_value(5).for(:accuracy) }
  it { should_not allow_value("string").for(:accuracy) }
  it { should allow_value(5).for(:student_id) }

end
