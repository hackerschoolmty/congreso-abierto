require 'rails_helper'

RSpec.describe Commission, type: :model do
  let(:commission) { FactoryGirl.build(:commission) }

  subject { commission }

  context 'validations' do
    it { should be_valid }
  end

  context 'associations' do
    it { should belong_to(:commission_topic) }
    it { should belong_to(:legislature) }
    it { should have_many(:commission_representatives) }
  end
end
