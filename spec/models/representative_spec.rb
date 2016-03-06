require 'rails_helper'

RSpec.describe Representative, type: :model do
  let(:representative) { FactoryGirl.build(:representative) }

  subject { representative }

  context 'validations' do
    it { should be_valid }
  end

  context 'associations' do
    it { should have_many(:commission_representatives) }
    it { should have_many(:legislature_representatives) }
    it { should have_many(:votes) }
  end

end
