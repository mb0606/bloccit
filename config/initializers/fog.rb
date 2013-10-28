# Adding Amazon S3 to Carrierwave
CarrierWave.configure do |config| 
  config.fog_credentials = { 
    :provider               => 'AWS', 
    :aws_access_key_id      => ENV["AKIAI7CXRSS6XOOD53YA"], 
    :aws_secret_access_key  => ENV["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"], 
  }
  config.cache_dir = "#{Rails.root}/tmp/uploads" 
  config.fog_directory  = ENV["AWS_BUCKET"]
  config.fog_public     = false
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'} 
end 

# Ref:
# https://support.cloud.engineyard.com/entries/20996881
#-Use-CarrierWave-and-Optionally-Fog-to-Upload-and-Store-Files#update3
# http://stackoverflow.com/questions/7946819/carrierwave-and-amazon-s3


