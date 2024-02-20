FactoryBot.define do
  factory :user do
    unique_name           { "#{Faker::Name.name}" }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password }
    password_confirmation { password }

    trait :with_friends do
      after :create do |user|
        create :friendship, user: user, friend: create(:user)
        create :friendship, user: user, friend: create(:user)
      end
    end

    trait :with_mutual_friends do
      after :create do |user|
        create :friendship, user: user, friend: create(:user), mutual: true
        create :friendship, user: user, friend: create(:user), mutual: true
      end
    end

    trait :with_posts do
      after :create do |user|
        create_list(:post, 3, user: user, text: 'This is a post.')
      end
    end
  end
end
