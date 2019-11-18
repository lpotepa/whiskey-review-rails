# frozen_string_literal: true

module Api
  module V1
    class WhiskeysController < ApplicationController
      before_action :set_whiskey, only: %i[show update destroy]

      def index
        if filters.empty?
          render json: WhiskeyRepresenter.collection(
            Whiskey.eager_load(:ratings)
          )
        else
          render json: WhiskeyRepresenter.collection(
            Whiskey.filter(filters)
          )
        end
      end

      def show
        render json: WhiskeyRepresenter.one(@whiskey)
      end

      def create
        whiskey = Whiskeys::Create.new(permitted_params).call
        if whiskey.valid?
          render json: WhiskeyRepresenter.one(whiskey)
        else
          render json: whiskey.errors.full_messages.join(', '),
                 status: 422
        end
      end

      def update
        updated_whiskey = Whiskeys::Update.new(@whiskey, permitted_params).call
        if updated_whiskey.valid?
          render json: WhiskeyRepresenter.one(updated_whiskey)
        else
          render json: updated_whiskey.errors.full_messages.join(', '),
                 status: 422
        end
      end

      def destroy
        if @whiskey.destroy
          render json: @whiskey
        else
          render json: @whiskey.errors.full_messages.join(', '),
                 status: 422
        end
      end

      private

      def set_whiskey
        @whiskey = Whiskey.eager_load(:ratings).find_by_id(params[:id])
        return render json: { error: 'Not found' }, status: 404 unless @whiskey
      end

      def permitted_params
        params.permit(:name,
                      :description,
                      *Whiskey::RATING_TYPES,
                      ratings: Whiskey::RATING_TYPES)
      end

      def filters
        permitted_params.slice(*Whiskey::RATING_TYPES)
      end
    end
  end
end
