require 'rails_helper'

describe Teacher do
  it { should have_many(:students) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
end