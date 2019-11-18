# frozen_string_literal: true

module Whiskeys
  class Update
    include Whiskeys::Attributes
    attr_accessor :whiskey, :params
    def initialize(whiskey, params)
      @whiskey = whiskey
      @params = params
    end

    def call
      update
      whiskey
    end

    private

    def update
      Whiskey.transaction do
        whiskey.ratings.destroy_all
        whiskey.update(params.slice(:name, :description)
          .merge(ratings_attributes: ratings(params)))
        raise ActiveRecord::Rollback unless whiskey.valid?
      end
    end
  end
end
