FactoryGirl.define do
  factory :user do |u|
    email "example@example.com"
    password "example"
    password_confirmation { |u| u.password }
  end
end