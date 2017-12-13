# frozen_string_literal: true

include ActionDispatch::TestProcess

FactoryBot.define do
  factory :place do
    address '横浜市XX区XX 1-1-1'
    tel '0451112222'

    trait :park do
      type 'Park'
      description 'これはテスト。これは公園です'
    end

    trait :cafe do
      type 'Cafe'
      description 'これはテスト。これはカフェです'
    end

    trait :restaurant do
      type 'Restaurant'
      description 'これはテスト。これはレストランです'
    end
  end
end
