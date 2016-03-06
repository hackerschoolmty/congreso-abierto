require 'rails_helper'

RSpec.describe Education, type: :model do
  let(:education) { FactoryGirl.build(:education) }

  subject { education }

  it_behaves_like 'sti model'

  context 'validations' do
    it { should be_valid }
  end



end
