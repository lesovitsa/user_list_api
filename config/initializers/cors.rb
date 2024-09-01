Rails.application.config.middleware.use Rack::Cors do
    allow do
      origins '*'
      resource '*', headers: :any, methods: %i(get post patch put delete options)
    end
  end