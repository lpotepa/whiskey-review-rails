# frozen_string_literal: true

module Whiskeys
  class Create
    include Whiskeys::Attributes
    attr_accessor :params
    def initialize(params)
      @params = params
    end

    def call
      Whiskey.create(params.slice(:name, :description)
        .merge(ratings_attributes: ratings(params)))
    end
  end
end
