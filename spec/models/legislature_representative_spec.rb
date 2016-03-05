require 'rails_helper'

RSpec.describe LegislatureRepresentative, type: :model do
	let(:legislature_representative) {FactoryGirl.build(:legislature_representative)}

	subject { legislature_representative }

  context 'validations' do
  	it { should be_valid}
end
