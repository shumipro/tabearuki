json.restaurants @restaurants do |restaurant|
  json.name restaurant.name
  json.description restaurant.description
  json.image_url restaurant.image_url
end
