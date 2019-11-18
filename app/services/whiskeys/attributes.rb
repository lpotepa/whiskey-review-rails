# frozen_string_literal: true

module Whiskeys
  module Attributes
    def ratings(params)
      params[:ratings].slice(*Whiskey::RATING_TYPES).to_h.map do |(type, grade)|
        {
          rating_type: type.to_s,
          grade: grade
        }
      end
    end
  end
end
