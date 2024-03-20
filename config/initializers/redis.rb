Rails.application.configure do
  config.cache_store = :redis_cache_store, { url: ENV.fetch('REDIS_URL', nil) }
end
