FactoryBot.define do
  factory :fighter do
    name                { Faker::Name.name }

    trait :advanced_fighter do
      # Turn off validations so we can create experienced fighter
      to_create {|instance| instance.save(validate: false) }

      health              { Faker::Number.between(1,100) }
      strength            { Faker::Number.between(1,100) }
      experience          { Faker::Number.between(1,100) }
      level               { Faker::Number.between(1,100) }
      available_upgrade   { Faker::Number.between(1,100) }
    end

    trait :without_avaible_upgrade do
      # Turn off validations so we can create fighter without experience
      to_create {|instance| instance.save(validate: false) }

      available_upgrade   0
    end
  end
end
