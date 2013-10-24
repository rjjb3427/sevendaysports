require 'spec_helper'

describe Article do
  it { should belong_to(:event) }
  it { should validate_presence_of(:body) }
end
