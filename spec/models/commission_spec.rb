require 'rails_helper'

RSpec.describe Commission, type: :model do
  describe "associations" do

    it { should belong_to(:commission_topic) }

    skip "Missing Legislature model" do
      should belong_to(:legislature)
    end

  end
end
