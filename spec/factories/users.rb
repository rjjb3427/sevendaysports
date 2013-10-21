FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name  "Doe"
    email "example@example.com"
    password "12345678"
    password_confirmation "12345678"
    school_name "Mich State"
    address "123 test ave."
    city "sample"
    state "TS"
    zip "12345"
    dob Date.parse("2002-01-05")
  end
end