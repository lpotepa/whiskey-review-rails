# frozen_string_literal: true

require 'rails_helper'
require './spec/support/whiskey.rb'

describe Whiskeys::Create do
  context 'valid params' do
    subject { Whiskeys::Create.new(valid_params).call }
    it 'creates a whiskey and rating objects' do
      expect { subject }.to change {
        Whiskey.count
      }.by(1).and change { Rating.count }.by(3)
    end
  end
  context 'invalid params' do
    subject { Whiskeys::Create.new(invalid_params).call }
    it 'does not create a whiskey and its rating objects' do
      expect { subject }.to change {
        Whiskey.count
      }.by(0).and change { Rating.count }.by(0)
    end
  end
end
