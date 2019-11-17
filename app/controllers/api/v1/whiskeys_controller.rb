class Api::V1::WhiskeysController < ApplicationController
  def index
    render json: [{name: "Rose"}]
  end
end
