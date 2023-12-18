FactoryBot.define do
  factory :user do
    name  { Faker::Name.name }
    email { Faker::Internet.email }

    trait :with_friends do
      after :create do |user|
        create :friendship, user: user, friend: create(:user)
        create :friendship, user: user, friend: create(:user)
      end
    end
  end
end
