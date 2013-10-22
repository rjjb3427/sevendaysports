require 'spec_helper'

describe Score do
  it "requires an #author to be present" do
    score = FactoryGirl.build :score, author: nil
    expect(score).not_to be_valid
    score.author = "Bill Cartwright"
    expect(score.author).to eq "Bill Cartwright"
  end

  it "requires a #description to be present" do
    score = FactoryGirl.build :score, description: nil
    expect(score).not_to be_valid
    score.description = "First round playoff knockout"
    expect(score.description).to eq "First round playoff knockout"
  end

  it "requires a #home_team_score to be present" do
    score = FactoryGirl.build :score, home_team_score: nil
    expect(score).not_to be_valid
    score.home_team_score = "36"
    expect(score.home_team_score).to eql "36"
  end

  it "requires an #away_team_score to be present" do
    score = FactoryGirl.build :score, away_team_score: nil
    expect(score).not_to be_valid
    score.away_team_score = "32"
    exect(score.away_team_score).to eql "32"
  end
end
