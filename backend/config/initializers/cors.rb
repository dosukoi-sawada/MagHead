Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "localhost:8080" # dev frontend port

    resource "*",
      headers: :any,
      expose: ["access-token", "expiry", "token-type", "uid", "client"],
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end