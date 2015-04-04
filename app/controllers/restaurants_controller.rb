require Rails.root.join('lib/gurunavi')

class RestaurantsController < ApplicationController
  def index
    client = Gurunavi::Client.new(Rails.application.secrets.gurunavi_api_access_key)
    result = client.ouen_photo_search(lat: '35.658517',lng: '139.701334')
    @restaurants = Restaurant.parse_from_gurunavi_response(result)
  end
end
