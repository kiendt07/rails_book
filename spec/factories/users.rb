FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password "123456"
  end

  factory :invalid_user do
    name ""
    email nil
  end
end
