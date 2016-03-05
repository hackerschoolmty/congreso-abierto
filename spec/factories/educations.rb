FactoryGirl.define do
  factory :education do
    starts_on { Date::today }
    ends_on { Date::tomorrow }
    institution_name { FFaker::Food.ingredient }
    description { FFaker::Lorem.paragraph }
    degree { FFaker::Food.fruit }
  end
end
