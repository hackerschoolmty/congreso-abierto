require 'rails_helper'

RSpec.describe LegislatureRepresentative, type: :model do
	let(:legislature_representative) {FactoryGirl.build(:legislature_representative)}

	subject { legislature_representative }

  context 'validations' do
  	it { should be_valid}
  end

  context 'associations' do
    it { should belong_to :district }
    it { should belong_to :legislature }
    it { should belong_to :representative }
  end
end
