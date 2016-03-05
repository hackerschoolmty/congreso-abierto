FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    password { 'changeme' }
    password_confirmation { 'changeme' }
    first_name { FFaker::Name.first_name }
    last_name  { FFaker::Name.last_name }
  end
end
