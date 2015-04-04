json.restaurants @restaurants do |restaurant|
  json.extract! restaurant, :id, :name, :distance, :image_urls
end
