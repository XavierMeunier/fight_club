FactoryBot.define do
  factory :fight do
    winner_punches  { Faker::Number.between(1,100) }
    looser_punches  { Faker::Number.between(1,100) }
    victory_type    { [:KO, :decision].sample }
    rounds          { Faker::Number.between(1,10) }
    association :winner, factory: :fighter
    association :looser, factory: :fighter
  end
end
