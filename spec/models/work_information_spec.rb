require 'rails_helper'

RSpec.describe WorkInformation, type: :model do
  let(:work_information) { FactoryGirl.build(:work_information) }

  subject { work_information }

  it_behaves_like 'sti model'
  
  context 'validations' do
    it { should be_valid }
  end
end
