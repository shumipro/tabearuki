json.restaurants @restaurants do |restaurant|
  json.extract! restaurant, :id, :name, :distance, :image_urls
end
json.meta do
  json.current_page params[:page].to_i
end
