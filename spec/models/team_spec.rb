require 'spec_helper'

describe Team do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:sport_type) }

  describe "associations" do
    it { should have_many(:home_events) }
    it { should have_many(:away_events) }
    it { should belong_to(:university) }
  end
end
