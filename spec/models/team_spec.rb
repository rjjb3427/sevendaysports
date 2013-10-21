require 'spec_helper'

describe Team do
  it "requires a #name" do
    team = FactoryGirl.build :team, name: nil
    expect(team).not_to be_valid
    team.name = "Haberdashers"
    expect(team.name).to be_present
  end

  it "requires a #sport_type" do
    team = FactoryGirl.build :team, sport_type: nil
    expect(team).not_to be_valid
    team.sport_type = "softball"
    expect(team.sport_type).to be_present
  end

  it "belongs to .University" do
    team = FactoryGirl.build :team, university_id: nil
    expect(team.university_id).to be_blank
    team.university_id = 5
    expect(team.university_id).to eql 5 
  end
end
