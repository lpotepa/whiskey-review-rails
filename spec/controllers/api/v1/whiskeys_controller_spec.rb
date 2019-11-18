# frozen_string_literal: true

require 'rails_helper'
require './spec/support/whiskey.rb'

describe Api::V1::WhiskeysController, type: :request do
  describe 'GET /api/v1/whiskeys' do
    context 'no params provided' do
      it 'returns all whiskey list' do
        10.times { create(:whiskey_with_ratings) }
        get '/api/v1/whiskeys'
        result = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(result.length).to eq 10
      end
    end
    context 'grade params provided' do
      it 'returns filtered result set' do
        10.times { create(:whiskey_with_ratings) }
        10.times { create(:whiskey_with_3_grade_ratings) }
        get '/api/v1/whiskeys?color=4&taste=4&smokiness=3'
        result = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(result.length).to eq 10
      end
    end
  end

  describe 'GET /api/v1/whiskeys/:id' do
    context 'whiskey present' do
      it 'returns a single whiskey' do
        whiskey = create(:whiskey_with_ratings)
        get "/api/v1/whiskeys/#{whiskey.id}"
        expect(response.status).to eq 200
      end
    end

    context 'whiskey not present' do
      it 'returns a 404' do
        get '/api/v1/whiskeys/12345'
        expect(response.status).to eq 404
      end
    end
  end

  describe 'POST /api/v1/whiskeys' do
    context 'valid params' do
      it 'returns status 200' do
        post '/api/v1/whiskeys', params: valid_params
        expect(response.status).to eq 200
      end
    end
    context 'invalid params' do
      it 'returns status 422' do
        post '/api/v1/whiskeys', params: invalid_params
        expect(response.status).to eq 422
      end
    end
  end

  describe 'PUT /api/v1/whiskeys/:id' do
    context 'valid params' do
      let(:whiskey) { create(:whiskey_with_3_grade_ratings) }
      it 'updates an whiskey' do
        put "/api/v1/whiskeys/#{whiskey.id}", params: valid_params
        expect(response.status).to eq 200
      end
    end
    context 'invalid params' do
      let(:whiskey) { create(:whiskey_with_3_grade_ratings) }
      it 'returns status 422' do
        put "/api/v1/whiskeys/#{whiskey.id}", params: invalid_params
        expect(response.status).to eq 422
      end
    end
    context 'whiskey not present' do
      it 'returns a 404' do
        put '/api/v1/whiskeys/12345'
        expect(response.status).to eq 404
      end
    end
  end

  describe 'DELETE /api/v1/whiskeys' do
    context 'whiskey present' do
      let(:whiskey) { create(:whiskey_with_ratings) }
      it 'returns status 200' do
        delete "/api/v1/whiskeys/#{whiskey.id}"
        expect(response.status).to eq 200
      end
    end
    context 'whiskey not present' do
      it 'returns status 200' do
        delete '/api/v1/whiskeys/12345'
        expect(response.status).to eq 404
      end
    end
  end
end
