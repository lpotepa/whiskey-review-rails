# frozen_string_literal: true

class RatingRepresenter
  class << self
    def one(rating)
      rating.slice(:grade, :rating_type)
    end

    def collection(ratings)
      ratings.map do |rating|
        one(rating)
      end
    end
  end
end
