require 'rails_helper'

RSpec.describe Seat, type: :model do
  let(:seat) { FactoryGirl.build(:seat) }

  subject { seat }

  context 'validations' do
    it { should be_valid }
  end

  context 'associations' do
    it { should have_many(:legislature_representatives) }
  end

end
