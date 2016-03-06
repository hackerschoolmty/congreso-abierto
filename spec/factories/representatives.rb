FactoryGirl.define do
  factory :representative do
    first_name          { FFaker::Name.first_name }
    last_name           { FFaker::Name.last_name }
    email               { FFaker::Internet.email }
    phone               { '8181818181' }
    representative_type { 1 }
    twitter             { 'zenbakiak' }
    facebook            { 'zenbakiak' }
  end
end
