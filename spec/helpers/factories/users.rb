FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    email { 'john@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
    confirmed_at { Time.now }
    confirmation_sent_at { Time.now }
  end
end
