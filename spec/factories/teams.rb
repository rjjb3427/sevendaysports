FactoryGirl.define do
  factory :team do |f|
    f.name 'Bengals'
    f.sport_type 'softball'
    f.university_id '1'
    f.association :university
  end
end
