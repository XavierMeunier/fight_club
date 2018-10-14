FactoryBot.define do
  factory :fighter do
    name                { Faker::Name.name }

    trait :advanced_fighter do
      # Turn off validations so we can create experienced fighter
      to_create {|instance| instance.save(validate: false) }

      health              { Faker::Number.between(1,100) }
      strengh             { Faker::Number.between(1,100) }
      experience          { Faker::Number.between(1,100) }
      level               { Faker::Number.between(1,100) }
      available_upgrade   { Faker::Number.between(1,100) }
    end
  end
end
