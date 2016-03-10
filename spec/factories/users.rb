FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    password { 'changeme' }
    password_confirmation { 'changeme' }
    first_name { FFaker::Name.first_name }
    last_name  { FFaker::Name.last_name }

    factory :root_user do
      role { 1 }
    end

    factory :observer_user do
      role { 0 }

      factory :active_observer_user do 
        status { 0 }
      end

      factory :inactive_observer_user do 
        status { 1 }
      end


    end

  end
end
