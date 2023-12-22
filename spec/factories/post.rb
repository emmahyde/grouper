FactoryBot.define do
  factory :post do
    text { 'This is a post' }
    user
  end
end
