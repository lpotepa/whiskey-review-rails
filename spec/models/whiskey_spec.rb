# frozen_string_literal: true

require 'rails_helper'
require './spec/support/whiskey.rb'

describe Whiskey, type: :model do
  context 'missing name' do
    let(:whiskey) { Whiskey.new(valid_whiskey_params.merge(name: nil)) }
    it 'is invalid' do
      expect(whiskey).to be_invalid
    end
  end
  context 'missing description' do
    let(:whiskey) { Whiskey.new(valid_whiskey_params.merge(description: nil)) }
    it 'is invalid' do
      expect(whiskey).to be_invalid
    end
  end
  context 'it lacks one rating type' do
    let(:whiskey) { Whiskey.new(invalid_whiskey_params) }
    it 'is invalid' do
      expect(whiskey).to be_invalid
    end
  end
  context 'has extra rating type' do
    it 'is invalid' do
      expect do
        Whiskey.new(invalid_whiskey_params_with_extra_rating_type)
      end.to raise_error(ArgumentError)
    end
  end
  context 'has valid params' do
    let(:whiskey) { Whiskey.new(valid_whiskey_params) }
    it 'is valid' do
      expect(whiskey).to be_valid
    end
  end
end
