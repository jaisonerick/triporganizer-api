CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test?
    config.storage = :file
  else
    config.storage = :fog

    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: 'us-east-1',
      endpoint: 'https://s3.amazonaws.com'
    }
    config.fog_directory  = ENV['AWS_S3_BUCKET_NAME']
    config.fog_public     = true
  end
end
