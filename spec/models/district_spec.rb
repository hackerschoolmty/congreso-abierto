require 'rails_helper'

RSpec.describe District, type: :model do
  let(:district) { FactoryGirl.build(:district) }

  subject { district }

  context 'validations' do
    it { should be_valid }
  end

  context 'associations' do
    it { should have_many(:legislature_representatives) }
  end

end
