FactoryBot.define do
  factory :friendship do
    user
    friend factory: :user
  end
end
