FactoryGirl.define do
  factory :user do |u|
    email "example@example.com"
    password "example"
    password_confirmation { |u| u.password }
  end
  
  factory :album do
    title 'album title'
    artist 'album artist'
    association :user
  end
end