require 'spec_helper'

describe Event do
  it "requires an #author to be present" do
    event = FactoryGirl.build :event, author: nil
    expect(event).not_to be_valid
    event.author = "Jimmy Dean"
    expect(event.author).to be_present
  end

  it "requires a #name to be present" do
    event = FactoryGirl.build :event, name: nil
    expect(event).not_to be_valid
    event.name = "playoffs"
    expect(event.name).to be_present
  end

  it "requires a #title to be present" do
    event = FactoryGirl.build :event, title: nil
    expect(event).not_to be_valid
    event.title = "The standoff"
    expect(event.title).to be_present
  end

  it "requires an #event_on date to be present" do
    event = FactoryGirl.build :event, event_on: nil
    expect(event).not_to be_valid
    event.event_on = Date.parse("2014-05-05")
    expect(event.event_on).to be_present
  end

  it "has #details" do
    event = FactoryGirl.build :event
    expect(event.details).to be_present
  end

  it "has a #home_team_score" do
    event = FactoryGirl.build :event
    expect(event.home_team_score).to be_present
  end

  it "has an #away_team_score" do
    event = FactoryGirl.build :event
    expect(event.away_team_score).to be_present
  end
end
