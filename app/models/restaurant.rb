class Restaurant
  include ActiveModel::Model

  attr_accessor :id, :name, :distance, :image_urls

  class << self
    def parse_from_gurunavi_response(response)
      body = response.body
      count = body["response"]["hit_per_page"]
      restaurants = []
      0.upto(count-1) do |i|
        params = {}
        restaurant = body["response"][i.to_s]
        photo = restaurant["photo"]
        params[:id] = photo["shop_id"]
        params[:distance] = photo["distance"]
        params[:name] = photo["shop_name"]
        params[:image_urls] = {
          large_url: photo["image_url"]["url_1024"],
          midium_url: photo["image_url"]["url_320"],
          small_url: photo["image_url"]["url_200"],
        }
        restaurants << self.new(params)
      end
      restaurants
    end
  end
end
