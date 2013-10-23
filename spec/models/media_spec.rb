require 'spec_helper'

describe Media do
  it "requires an #author to be present" do 
    media = FactoryGirl.build :media, author: nil
    expect(media).not_to be_valid 
    media.author = "happy gilmore"
    expect(media).to be_valid
  end

  it "requires #details to be present" do
    media = FactoryGirl.build :media, details: nil
    expect(media).not_to be_valid
    media.details = "Happy gilmore taking golf swing"
    expect(media).to be_valid
  end

  it "requires #title to be present" do 
    media = FactoryGirl.build :media, title: nil
    expect(media).not_to be_valid
    media.title = "Gilmore's first golf swing"
    expect(media).to be_valid
  end

  it "requires #type to be present" do
    media = FactoryGirl.build :media, type: nil
    expect(media).not_to be_valid
    media.type = "image"
    expect(media).to be_valid
  end

  it "requires #url to be present" do
    media = FactoryGirl.build :media, url: nil
    expect(media).not_to be_valid
    media.url = "http://example.org"
    expect(media).to be_valid
  end
end
