FactoryGirl.define do
  factory :event do
    name "bengals vs lamas"
    author "charlie chattman"
    title "pre-season game"
    details "This is a hometown rivalry game"
    event_on "Date.parse(2015-05-05)"
    home_team_score 13
    away_team_score 8
    type "article"
  end
end
