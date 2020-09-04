ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  domain: 'gmail.com',
  port: 587,
  user_name: ENV["GMAIL_ADDRESS"],
  password: ENV["GOOGLE_PASSWORD"],
  authentication: 'plain',
  enable_starttls_auto: true
}
