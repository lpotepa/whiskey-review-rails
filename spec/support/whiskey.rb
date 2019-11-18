# frozen_string_literal: true

def valid_params
  {
    name: 'Jack Daniels',
    description: 'Made in Tenessee',
    ratings: { color: 5, taste: 6, smokiness: 7 }
  }.with_indifferent_access
end

def valid_whiskey_params
  {
    name: 'Jack Daniels',
    description: 'Made in Tenessee',
    ratings_attributes: [
      { rating_type: :color, grade: 5 },
      { rating_type: :taste, grade: 6 },
      { rating_type: :smokiness, grade: 7 }
    ]
  }.with_indifferent_access
end

def invalid_whiskey_params_with_extra_rating_type
  {
    name: 'Jack Daniels',
    description: 'Made in Tenessee',
    ratings_attributes: [
      { rating_type: :color, grade: 5 },
      { rating_type: :taste, grade: 6 },
      { rating_type: :smokiness, grade: 7 },
      { rating_type: :forbidden, grade: 7 }
    ]
  }.with_indifferent_access
end

def invalid_whiskey_params
  {
    name: 'Jack Daniels',
    description: 'Made in Tenessee',
    ratings_attributes: [
      { rating_type: :taste, grade: 6 },
      { rating_type: :smokiness, grade: 7 }
    ]
  }.with_indifferent_access
end

def invalid_params
  {
    name: 'Jack Daniels',
    description: 'Made in Tenessee',
    ratings: { taste: 6, smokiness: 7 }
  }.with_indifferent_access
end
