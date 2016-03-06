require 'rails_helper'

RSpec.describe CommissionRepresentative, type: :model do
  let(:commission_representative) { FactoryGirl.build(:commission_representative) }

  subject { commission_representative }

  context 'validations' do
    it { should be_valid }
  end

  context 'associations' do
    it { should belong_to(:commission) }
    it { should belong_to(:representative) }
  end


end
