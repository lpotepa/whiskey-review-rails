# frozen_string_literal: true

class WhiskeyRepresenter
  class << self
    def one(whiskey)
      {
        id: whiskey.id,
        created_at: whiskey.created_at,
        name: whiskey.name,
        description: whiskey.description,
        ratings: whiskey.ratings.reduce({}) do |memo, rating|
          memo[rating.rating_type] = rating.grade
          memo
        end
      }
    end

    def collection(whiskeys)
      whiskeys.map do |whiskey|
        one(whiskey)
      end
    end
  end
end
