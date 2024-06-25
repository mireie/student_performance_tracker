# frozen_string_literal: true

require "rails_helper"

describe Student do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should belong_to(:teacher) }
end
