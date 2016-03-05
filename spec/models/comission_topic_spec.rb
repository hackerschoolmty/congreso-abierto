require 'rails_helper'

RSpec.describe ComissionTopic, type: :model do
  it { should have_many(:comissions) }
end
