class Restaurant
  include ActiveModel::Model

  attr_accessor :id, :name, :distance, :image_urls, :business_hour, :description_long, :description_short, :address, :tel, :url, :holiday

  class << self
    def build_list_from_gurunavi_response(response)
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

    def build_from_gurunavi_response(response)
      body = response.body
      # XXX: なぜかパースされずに文字列になっている
      rest = (JSON.parse(body))["rest"]
      params = {}
      params[:id] = rest["id"]
      params[:name] = rest["name"]["name"]
      params[:business_hour] = rest["business_hour"]
      params[:holiday] = rest["holiday"]
      params[:description_long] = rest["sales_points"]["pr_long"]
      params[:description_short] = rest["sales_points"]["pr_short"]
      params[:address] = rest["contacts"]["address"]
      params[:tel] = rest["contacts"]["tel"]
      params[:url] = rest["url"]
      self.new(params)
    end
  end
end
