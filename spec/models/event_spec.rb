require 'spec_helper'

describe Event do
  it { should validate_presence_of(:author) }

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:title) }

  it { should validate_presence_of(:event_on) }

  describe "#winner" do
    context "a winning home team" do
      it "returns the home team name" do
        event =  Event.new(home_team_score: 20, away_team_score: 10)
        event.home_team = Team.new(name: 'prune juice fruit')
        # event.home_team_score = 20
        # event.away_team_score = 10
        expect(event.winner).to eq event.home_team.name
      end

      it "doesn't return a losing away team name" do
        event = Event.new
        event.home_team_score = 20
        event.away_team_score = 10
        event.away_team = Team.new(name: "blue jays")
        expect(event.winner).not_to eq event.away_team.name
      end
    end

    context "a winning away team" do
      it "returns a winning away team name" do
        event = Event.new
        event.home_team_score = 7
        event.away_team_score = 9
        event.away_team = Team.new(name: "blue jays")
        expect(event.winner).to eq event.away_team.name
      end

      it "doesn't return a losing home team name" do
        event = Event.new
        event.home_team_score = 7
        event.away_team_score = 9
        event.home_team = Team.new(name: "blue jays")
        expect(event.winner).not_to eq event.home_team.name
      end
    end

    context "tie game" do
      it "returns both home and away team names" do
        event = Event.new
        event.home_team_score = 14
        event.away_team_score = 14
        event.home_team = Team.new(name: "bengals")
        event.away_team = Team.new(name: "blue jays")
        expect(event.winner).to eq "#{event.home_team.name} #{event.away_team.name}"  
      end

      it "doesn't return only a home team name" do
        event = Event.new
        event.home_team_score = 14
        event.away_team_score = 14
        event.home_team = Team.new(name: "bengals")
        event.away_team = Team.new(name: "blue jays")
        expect(event.winner).not_to eq event.home_team.name
      end

      it "doesn't return only an away team name" do
        event = Event.new
        event.home_team_score = 14
        event.away_team_score = 14
        event.home_team = Team.new(name: "bengals")
        event.away_team = Team.new(name: "blue jays")
        expect(event.winner).not_to eq event.away_team.name
      end
    end
  end

  describe "associations" do
    context "Event parent associations" do
      it { should have_many(:articles) }
      it { should have_many(:medias) }
    end

    context "Event decendant associations" do 
      it { should belong_to(:home_team) }
      it { should belong_to(:away_team) } 
      it { should belong_to(:user) }
    end
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
