# frozen_string_literal: true

class WhiskeyRepresenter
  class << self
    def one(whiskey)
      {
        id: whiskey.id,
        created_at: whiskey.created_at,
        name: whiskey.name,
        description: whiskey.description,
        ratings: RatingRepresenter.collection(whiskey.ratings)
      }
    end

    def collection(whiskeys)
      whiskeys.map do |whiskey|
        one(whiskey)
      end
    end
  end
end
