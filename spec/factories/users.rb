FactoryBot.define do
  factory :user do
    name  { FFaker::NameBR.name }
    email { FFaker::Internet.email }
    password { FFaker::Internet.password }
  end
end
