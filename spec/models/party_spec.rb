require 'rails_helper'

RSpec.describe Party, type: :model do
  let(:party) {FactoryGirl.build(:party)}

  subject { party }

  context 'validations' do
    it { should be_valid}
  end

end
