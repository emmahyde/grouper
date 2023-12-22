FactoryBot.define do
  factory :user do
    name  { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }

    trait :with_friends do
      after :create do |user|
        create :friendship, user: user, friend: create(:user)
        create :friendship, user: user, friend: create(:user)
      end
    end

    trait :with_posts do
      after :create do |user|
        create :post, user: user, text: 'This is a post.'
      end
    end
  end
end
