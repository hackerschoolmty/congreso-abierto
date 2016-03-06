FactoryGirl.define do
  factory :legislature do
    starts_on { Date.today }
    ends_on   { Date.today + 3.years }
    name      { 'XXIIV' }
    status    { Legislature.statuses[:inactive] }
  end
end
