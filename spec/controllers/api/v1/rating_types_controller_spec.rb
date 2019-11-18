# frozen_string_literal: true

require 'rails_helper'
require './spec/support/whiskey.rb'

describe Api::V1::RatingTypesController, type: :request do
  describe 'GET /api/v1/rating_types' do
    context 'invalid type provided' do
      it 'returns 422 status code' do
        get '/api/v1/rating_types?type=invalid'
        expect(response.status).to eq 422
      end
    end
    context 'valid type provided' do
      it 'returns a list of rating types' do
        get '/api/v1/rating_types?type=whiskey'
        expect(response.status).to eq 200
        expect(JSON.parse(response.body)).to be_an_instance_of(Array)
      end
    end
  end
end
