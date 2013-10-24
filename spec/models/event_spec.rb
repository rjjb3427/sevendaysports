require 'spec_helper'

describe Event do
  it { validate_presence_of(:author) }

  it { validate_presence_of(:name) }

  it { validate_presence_of(:title) }

  it { validate_presence_of(:event_on) }

  describe "associations" do
    it { should have_many(:articles) }
    it { should have_many(:medias) }
    # how to name more than 1 foreign key from a parent class?
    # it { should belong_to(:team) } 
    it { should belong_to(:user) }
  end

  describe "scopes" do
    describe ".upcoming_events" do
      it "queries for future events up to 3 days from current time" do
        future_events = FactoryGirl.create :event, event_on: 2.days.from_now, name: "future"
        past_events = FactoryGirl.create :event, event_on: 1.day.ago, name: "past"
        expect(future_events.event_on).to be > 1.minute.from_now
        expect(future_events.event_on).not_to be > 3.days.from_now
      end

      it "should not include query results less than current time" do
        future_events = FactoryGirl.create :event, event_on: 1.day.from_now, name: "future"
        past_events = FactoryGirl.create :event, event_on: 1.minute.ago, name: "past"
        current_time = Time.now
        expect(future_events.event_on).to be > current_time
      end
    end

    describe ".past_events" do
      it "queries for past events less than 4 days from currnent time" do
        old_events = FactoryGirl.create :event, event_on: 10.days.ago, name: "old"
        recent_events = FactoryGirl.create :event, event_on: 1.day.ago, name: "recent"
        expect(recent_events.event_on.to_s).to eql 1.day.ago.to_s
        expect(recent_events.event_on.to_s).not_to eql 4.days.ago.to_s
      end
    end

    describe ".recent_articles" do
      it "queries for events less than 4 days old" do
        older_time = 4.days.ago
        recent_time = 3.days.ago
        older_articles = FactoryGirl.create :event, event_on: older_time, name: "older"
        recent_articles = FactoryGirl.create :event, event_on: recent_time, name: "recent"
        expect(older_articles.event_on).to be < recent_time
        expect(recent_articles.event_on).to eq recent_time
        expect(recent_articles.event_on).to be > older_time
      end
    end

    describe ".recent_scores" do
      it "queries for events less than 4 days old" do
        recent_scores = FactoryGirl.create :event, event_on: 3.days.ago, name: "recent"
        older_scores = FactoryGirl.create :event, event_on: 4.days.ago, name: "older"
        expect(recent_scores.event_on).to be > 4.days.ago
        expect(older_scores.event_on).to be < 3.days.ago
      end
    end
  end
end
