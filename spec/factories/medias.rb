FactoryGirl.define do
  factory :media do
    author "charlie chattman"
    details "This is the first image"
    title "first image"
    type "image"
    url "http://example.com"
    event_id 1
    team_id 1
    user_id 1
  end
end
