# frozen_string_literal: true

module Ratable
  extend ActiveSupport::Concern

  included do
    has_many :ratings, as: :ratable, dependent: :destroy
    accepts_nested_attributes_for :ratings
    validate :all_required_types
    self::RATING_TYPES.each do |column|
      scope :"with_#{column}",
            ->(grade) { joins(rating_sql(column, grade)) }
    end

    private

    def all_required_types
      self.class::RATING_TYPES.each do |type|
        unless ratings.find { |rating| rating.rating_type == type }
          errors.add(:"rating_#{type}", 'Not present')
        end
      end
    end

    def self.rating_sql(column, grade)
      <<-SQL
        JOIN ratings #{column} ON #{column}.ratable_id = #{to_s.downcase.pluralize}.id
        AND #{column}.rating_type = #{Rating.rating_types[column]}
        AND #{column}.grade >= #{sanitize_sql(grade)}
      SQL
    end
  end
end
