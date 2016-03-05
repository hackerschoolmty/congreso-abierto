require 'rails_helper'

RSpec.describe Party, type: :model do
  it { should define_enum_for(:status) }
end
