require 'rails_helper'

RSpec.describe ResumeEntry, type: :model do
  
  let(:resume_entry) { FactoryGirl.build(:resume_entry) }

  subject { resume_entry }

  context 'validations' do
    it { should be_valid }
  end

end
