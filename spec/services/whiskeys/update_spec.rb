# frozen_string_literal: true
# frozen_string_literal: trueco

require 'rails_helper'
require './spec/support/whiskey.rb'

describe Whiskeys::Update do
  context 'updates a whiskey and rating objects' do
    let(:whiskey) { create(:whiskey_with_3_grade_ratings) }
    it 'updates a record and sets its translation objects to pending status' do
      updated_whiskey = Whiskeys::Update.new(whiskey, valid_params).call
      expect(updated_whiskey.name).to eq valid_params[:name]
      expect(updated_whiskey.description).to eq valid_params[:description]
      expect(updated_whiskey.ratings.find_by(
        rating_type: 'color'
      ).grade).to eq valid_params[:ratings][:color]
      expect(updated_whiskey.ratings.find_by(
        rating_type: 'taste'
      ).grade).to eq valid_params[:ratings][:taste]
      expect(updated_whiskey.ratings.find_by(
        rating_type: 'smokiness'
      ).grade).to eq valid_params[:ratings][:smokiness]
    end
  end
  context 'invalid params' do
    let(:whiskey) { create(:whiskey_with_3_grade_ratings) }
    it 'does not update a whiskey and its rating objects' do
      updated_whiskey = Whiskeys::Update.new(whiskey, invalid_params).call
      expect(updated_whiskey.name).to eq whiskey.name
      expect(updated_whiskey.description).to eq whiskey.description
      expect(updated_whiskey.ratings.find_by(
        rating_type: 'color'
      ).grade).not_to eq valid_params[:ratings][:color]
      expect(updated_whiskey.ratings.find_by(
        rating_type: 'taste'
      ).grade).not_to eq valid_params[:ratings][:taste]
      expect(updated_whiskey.ratings.find_by(
        rating_type: 'smokiness'
      ).grade).not_to eq valid_params[:ratings][:smokiness]
    end
  end
end
