require 'spec_helper'

describe Team do
  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:sport_type) }

  describe "associations" do
    it { should have_many(:events).dependent(:destroy) }
    it { should belong_to(:university) }
  end
end
