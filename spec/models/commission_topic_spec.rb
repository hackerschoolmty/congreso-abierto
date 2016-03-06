require 'rails_helper'

RSpec.describe CommissionTopic, type: :model do
  it { should have_many(:commissions) }
end
