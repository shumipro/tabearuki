require Rails.root.join('lib/gurunavi')

class RestaurantsController < ApplicationController
  before_action :set_default_lat_and_lng
  before_action :lat_and_lng_must_be_valid
  before_action :set_default_page
  before_action :page_must_be_numeric

  def index
    client = Gurunavi::Client.new(Rails.application.secrets.gurunavi_api_access_key)
    response = client.ouen_photo_search(lat: params[:lat], lng: params[:lng], page: params[:page])
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

  def lat_and_lng_must_be_valid
    if !params[:lat].match(/\d+\.\d+/) || !params[:lng].match(/\d+\.\d+/)
      render partial: 'error', locals: { message: 'invalid lat or lng parameter' }, status: 500
    end
  end

  def set_default_page
    params[:page] ||= 1
  end

  def page_must_be_numeric
    if !params[:page].match(/\d+/)
      render partial: 'error', locals: { message: 'invalid page parameter' }, status: 500
    end
  end
end
