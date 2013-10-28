if Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.mandrillapp.com',
    :port           => '587',
    :authentication => :plain,
    :user_name      => ENV['app18840800@heroku.com'],
    :password       => ENV['3ExjkEyQRGq4_vsoCRKWXQ'],
    :domain         => 'heroku.com',
    :enable_starttls_auto => true
  }
end