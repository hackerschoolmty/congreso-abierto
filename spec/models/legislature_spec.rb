require 'rails_helper'

RSpec.describe Legislature, type: :model do
  let(:legislature) { FactoryGirl.build(:legislature) }
  subject { legislature }

  context 'validations' do
    it { should be_valid }
  end

  context 'associations' do
    it { should have_many(:legislature_representatives) }
  end
end
