require 'spec_helper'

describe Article do
  it "requires a #body" do
    article = FactoryGirl.build :article, body: nil
    expect(article).not_to be_valid
    article.body = "I am your first post!"
    expect(article.body).to eq "I am your first post!"
  end
end
