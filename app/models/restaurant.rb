class Restaurant
  include ActiveModel::Model

  attr_accessor :name, :description, :image_url

  validates :name, presence: true
  validates :description, presence: true
  validates :image_url, presence: true
end
