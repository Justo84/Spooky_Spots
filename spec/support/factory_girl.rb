require "factory_girl"

FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    sequence(:username) { |n| "user#{n}"}
    password "password"
    password_confirmation "password"
  end

  factory :admin, parent: :user do
    role "admin"
  end

  factory :location do
    name "name"
    description "This is a spooky spot location"
    town "Townville"
    state "MA"
    address "123 fake st."
    latitude 45.23981
    longitude 23.230238
  end

end
