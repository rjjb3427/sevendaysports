require 'spec_helper'

describe Event do
  it "requires an #author to be present" do
    event = FactoryGirl.build :event, author: nil
    expect(event).not_to be_valid
    event.author = "Jimmy Dean"
    expect(event).to be_valid
  end

  it "requires a #name to be present" do
    event = FactoryGirl.build :event, name: nil
    expect(event).not_to be_valid
    event.name = "playoffs"
    expect(event).to be_valid
  end

  it "requires a #title to be present" do
    event = FactoryGirl.build :event, title: nil
    expect(event).not_to be_valid
    event.title = "The standoff"
    expect(event).to be_valid
  end

  it "requires an #event_on date to be present" do
    event = FactoryGirl.build :event, event_on: nil
    expect(event).not_to be_valid
    event.event_on = Date.parse("2014-05-05")
    expect(event).to be_valid
  end

  describe "scopes" do
    describe ".recent_scores" do
      it "queries for events less than 3 days old" do
        old_event = FactoryGirl.create :event, event_on: 10.days.ago, name: "old"
        recent_event = FactoryGirl.create :event, event_on: 1.day.ago, name: "recent"
        recent_scores = Event.recent_scores
        expect(recent_scores).to eq [recent_event]
      end
    end

    describe ".recent_artics" do
      it "queries for events less than 3 days old" do
        old_event = FactoryGirl.create :event, event_on: 10.days.ago, name: "old"
        recent_event = FactoryGirl.create :event, event_on: 1.day.ago, name: "recent"
        recent_scores = Event.recent_scores
        expect(recent_scores).to eq [recent_event]
      end
    end

    describe ".recent_articles" do
      it "queries for events less than 3 days old" do
        old_event = FactoryGirl.create :event, event_on: 10.days.ago, name: "old"
        recent_event = FactoryGirl.create :event, event_on: 1.day.ago, name: "recent"
        recent_articles = Event.recent_articles
        expect(recent_articles).to eq [recent_event]
      end
    end

    describe ".recent_scores" do
      it "queries for events less than 3 days old" do
        old_event = FactoryGirl.create :event, event_on: 10.days.ago, name: "old"
        recent_event = FactoryGirl.create :event, event_on: 1.day.ago, name: "recent"
        recent_scores = Event.recent_scores
        expect(recent_scores).to eq [recent_event]
      end
    end
  end
end
