FactoryGirl.define do
  factory :user do
    first_name 'John'
    last_name  'Doe'
    email 'test@example.com'
    # sequence(:email) { |n| "user#{ n }@example.com" }
    password '12345678'
    password_confirmation '12345678'
    school_name 'Mich State'
    address '123 Test Ave.'
    city 'Sample'
    state 'TS'
    zip '12345'
    dob Date.parse("2022-01-05")
  end
end
