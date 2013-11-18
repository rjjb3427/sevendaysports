FactoryGirl.define do
  factory :event do |f|
    f.name "bengals vs lamas"
    f.author "charlie chattman"
    f.title "pre-season game"
    f.details "This is a hometown rivalry game"
    f.event_on "Date.parse(2015-05-05)"
    f.home_team_score 13
    f.away_team_score 8
    f.kind "article"
  end
end
