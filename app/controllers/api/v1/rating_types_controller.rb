# frozen_string_literal: true

module Api
  module V1
    class RatingTypesController < ApplicationController
      def index
        render json: params[:type].capitalize.constantize::RATING_TYPES
      rescue StandardError
        render json: { error: 'Unknown type' }, status: 422
      end
    end
  end
end
