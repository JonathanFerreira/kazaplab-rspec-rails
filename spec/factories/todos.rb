FactoryBot.define do
  factory :todo do
    name { FFaker::Lorem.word }
    done false
  end
end
