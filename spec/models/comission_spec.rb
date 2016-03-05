require 'rails_helper'

RSpec.describe Comission, type: :model do
  describe "associations" do
    it { should belong_to(:comission_topic) }
    skip "Missing Legislature model" do
      should belong_to(:legislature)
    end
  end
end
