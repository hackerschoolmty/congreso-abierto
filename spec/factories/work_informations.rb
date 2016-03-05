FactoryGirl.define do
  factory :work_information do
    starts_on { Date::today }
    ends_on { Date::tomorrow }
    institution_name { FFaker::Food.ingredient }
    description { FFaker::Lorem.paragraph }
    degree { FFaker::Food.fruit }
  end
end
