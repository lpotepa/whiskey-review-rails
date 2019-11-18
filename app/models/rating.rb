# frozen_string_literal: true

class Rating < ApplicationRecord
  enum rating_type: { color: 0, smokiness: 1, taste: 2 }
  belongs_to :ratable, polymorphic: true, optional: true
  validates :grade, presence: true, inclusion: { in: (1..10) }
  validates :rating_type, presence: true
end
