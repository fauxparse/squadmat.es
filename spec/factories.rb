FactoryGirl.define do
  sequence(:squad_name) { |n| "Squad #{n}" }
  sequence(:name) { |n| "Squadmate #{n}" }
  sequence(:email) { |n| "squadmate#{n}@sula.co" }

  factory :squad do
    name { generate(:squad_name) }

    trait :with_members do
      transient do
        managers_count 2
        members_count 5
      end

      after(:create) do |squad, evaluator|
        create_list(:manager, evaluator.managers_count, squad: squad)
        create_list(:member, evaluator.members_count, squad: squad)
      end
    end
  end

  factory :member do
    squad
    name { generate(:name) }
    email { generate(:email) }

    factory :manager do
      manager true
    end
  end
end
