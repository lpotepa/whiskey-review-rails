# frozen_string_literal: true

class Whiskey < ApplicationRecord
  RATING_TYPES = %w[taste color smokiness].freeze
  FILTER_COLUMNS = %w[name description].freeze

  include Ratable
  include Filterable
  validates :name, presence: true
  validates :description, presence: true
end
