# frozen_string_literal: true

module Filterable
  extend ActiveSupport::Concern

  included do
    self::FILTER_COLUMNS.each do |column|
      scope :"with_#{column}",
            ->(value) { where("#{column} ILIKE ?", "#{value}%") }
    end
  end

  module ClassMethods
    def filter(filters)
      results = where(nil)
      filters.each do |key, value|
        results = results.public_send("with_#{key}", value) if value.present?
      end
      results
    end
  end
end
