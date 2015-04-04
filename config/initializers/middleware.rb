config = Rails.application.config

config.middleware.delete Rack::ConditionalGet
config.middleware.delete Rack::ETag
config.middleware.delete Rack::MethodOverride
config.middleware.delete ActionDispatch::Session::CookieStore
config.middleware.delete ActionDispatch::Flash
