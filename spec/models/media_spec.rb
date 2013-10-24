require 'spec_helper'

describe Media do
  it { should validate_presence_of(:author) }

  it { should validate_presence_of(:details) }

  it { should validate_presence_of(:title) }

  it { should validate_presence_of(:type) }

  it { should validate_presence_of(:url) }
end
