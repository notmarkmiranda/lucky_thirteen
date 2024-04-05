FactoryBot.define do
  factory :league do
    name { Faker::Hipster.words(number: 4).join(" ") }
    description { Faker::Hipster.sentence }
    location { Faker::Address.full_address }
    public_league { false }
  end
end
