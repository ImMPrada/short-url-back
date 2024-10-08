# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin Ajax requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    if Rails.env.development? || Rails.env.test?
      origins 'http://localhost:5173'
    else
      origins 'https://short-url-front-git-main-miguel-pradas-projects.vercel.app', 'https://short-url-front-lac.vercel.app'
    end

    resource '*',
             headers: :any,
             methods: %i[get post put patch delete options head],
             credentials: true
  end
end
