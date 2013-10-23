require 'spec_helper'

describe Article do
  it "requires a #body to be present" do
    article = FactoryGirl.build :article, body: nil
    expect(article).not_to be_valid
    article.body = "I am your first post!"
    expect(article).to be_valid
  end
end
