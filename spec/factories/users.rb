# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "Pawel"
    last_name "Drozanski"
    sequence(:email) { |n| "pawel#{n}@drozanski.pl" }
  end
end
