require 'spec_helper'

describe University do
  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:address) }

  it { should validate_presence_of(:city) }

  it { should validate_presence_of(:state) }

  it { should validate_presence_of(:zip) }

  it { should validate_presence_of(:url) }
end
