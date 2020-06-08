FactoryBot.define do
  factory :user do
    name { 'John Malkovich' }
    username { 'johnm' }
    email { 'john@example.com' }
    external_id { nil }
  end
end