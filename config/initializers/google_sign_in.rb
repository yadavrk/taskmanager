Rails.application.configure do
  config.google_sign_in.client_id     = ENV['']
  config.google_sign_in.client_secret = ENV['']
end
