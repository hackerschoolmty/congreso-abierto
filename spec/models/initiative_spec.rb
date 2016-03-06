require 'rails_helper'

RSpec.describe Initiative, type: :model do
  let(:initiative) { FactoryGirl.build(:initiative) }

  subject { initiative }

  context 'validations' do
    it { should be_valid }
  end

  context 'associations' do
    it { should have_many(:votes) }
  end

end
