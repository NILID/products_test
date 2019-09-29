require 'faker'

# User roles list
#
# 1  = default
# 2  = admin

FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }

    password              { 'password' }
    password_confirmation { 'password' }

    trait :admin do
      after(:create) { |u| u.update_attribute(:roles_mask, 2) }
    end
  end
end
