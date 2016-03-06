require 'rails_helper'

RSpec.describe Vote, type: :model do
  let(:vote) { FactoryGirl.build(:vote) }

  subject { vote }

  context 'validations' do
    it { should be_valid }
  end

  context 'associations' do
    it { should belong_to(:initiative) }
    it { should belong_to(:representative) }
  end

end
