# frozen_string_literal: true

require 'factory_bot'

FactoryBot.define do
  factory :whiskey do
    name { 'Jim Beam' }
    description { 'Made in USA' }
  end

  factory :whiskey_with_ratings, parent: :whiskey do
    before(:create) do |_whiskey, evaluator|
      obj = evaluator.instance_variable_get('@instance')
      obj.ratings.build(rating_type: 'color', grade: 4)
      obj.ratings.build(rating_type: 'taste', grade: 5)
      obj.ratings.build(rating_type: 'smokiness', grade: 7)
    end
  end

  factory :whiskey_with_3_grade_ratings, parent: :whiskey do
    before(:create) do |_whiskey, evaluator|
      obj = evaluator.instance_variable_get('@instance')
      obj.ratings.build(rating_type: 'color', grade: 3)
      obj.ratings.build(rating_type: 'taste', grade: 3)
      obj.ratings.build(rating_type: 'smokiness', grade: 3)
    end
  end

  factory :rating do
  end
end
