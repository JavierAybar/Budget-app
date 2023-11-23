require 'faker'

FactoryBot.define do
    factory :user, aliases: [:author] do
        sequence(:name) { |n| "User #{n}" }
        email { Faker::Internet.email }
        password { 'password' }
    end

    factory :group do
        sequence(:name) { |n| "Group #{n}" }
        icon { 'https://example.com/icon.png' }
        user
    end

    factory :operation do
        sequence(:name) { |n| "Operation #{n}" }
        amount { Faker::Number.decimal(l_digits: 2) }
        user
        association :group
    end
end
