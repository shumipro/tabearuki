json.restaurant do
  json.extract! @restaurant, :id, :name, :business_hour, :holiday, :description_long, :description_short, :address, :tel, :url
end
