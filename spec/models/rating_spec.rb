# frozen_string_literal: true

require 'rails_helper'
require './spec/support/rating.rb'

describe Rating, type: :model do
  context 'missing grade' do
    let(:rating) { Rating.new(valid_rating_params.merge(grade: nil)) }
    it 'is invalid' do
      expect(rating).to be_invalid
    end
  end
  context 'missing rating_type' do
    let(:rating) { Rating.new(valid_rating_params.merge(rating_type: nil)) }
    it 'is invalid' do
      expect(rating).to be_invalid
    end
  end
  context 'has extra rating type' do
    it 'is invalid' do
      expect do
        Rating.new(valid_rating_params.merge(rating_type: 'extra'))
      end.to raise_error(ArgumentError)
    end
  end
  context 'has valid params' do
    let(:rating) { Rating.new(valid_rating_params) }
    it 'is valid' do
      expect(rating).to be_valid
    end
  end
end
