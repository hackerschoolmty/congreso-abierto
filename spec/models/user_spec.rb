require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) { FactoryGirl.build(:user) }

  subject { user }

  context 'validations' do
    it { should be_valid }
    it { should define_enum_for(:role) }
  end
end
