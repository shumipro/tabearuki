require Rails.root.join('lib/gurunavi')

class RestaurantsController < ApplicationController
  before_action :set_default_lat_and_lng
  before_action :must_be_valid_lat_and_lng

  def index
    client = Gurunavi::Client.new(Rails.application.secrets.gurunavi_api_access_key)
    response = client.ouen_photo_search(lat: params[:lat], lng: params[:lng])
    if response.error?
      render partial: 'error', locals: { message: 'API call error' }, status: 500
    else
      @restaurants = Restaurant.parse_from_gurunavi_response(response)
    end
  end

  private

  def set_default_lat_and_lng
    params[:lat] ||= '35.658517'
    params[:lng] ||= '139.701334'
  end

  def must_be_valid_lat_and_lng
    if !params[:lat].match(/\d+\.\d+/) || !params[:lng].match(/\d+\.\d+/)
      render partial: 'error', locals: { message: 'invalid lat or lng' }, status: 500
    end
  end
end
