require 'rails_helper'

RSpec.describe WorkInformation, type: :model do
  let(:work) { FactoryGirl.build(:work_information) }

  subject { work }

  context 'validations' do
    it { should be_valid }
  end
end
