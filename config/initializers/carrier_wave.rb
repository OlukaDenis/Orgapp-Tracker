if Rails.env.production?
    CarrierWave.configure do |config|
        config.fog_credentials = {
        # Configuration for Amazon S3
        :provider              => 'AWS',
        :aws_access_key_id     => ENV['S3_ACCESS_KEY'],
        :aws_secret_access_key => ENV['S3_SECRET_KEY'],
        :region                => ENV['S3_REGION']
        }
        config.fog_directory     =  ENV['S3_BUCKET']
        # config.fog_provider = 'fog/aws'

    end
end


# Setup Carrierwave to use local storage and disable file processing in test env
if Rails.env.test? || Rails.env.cucumber?
    CarrierWave.configure do |config|
        config.storage = :file
        config.enable_processing = false
    end

        # Separate out the upload folders for test environment.
    CarrierWave::Uploader::Base.descendants.each do |klass|
        next if klass.anonymous?
        klass.class_eval do
        def cache_dir
            "#{Rails.root}/spec/support/uploads/tmp"
        end
    
        def store_dir
            "#{Rails.root}/spec/support/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
        end
        end
    end

end

CarrierWave.configure do |config|
    config.asset_host = ActionController::Base.asset_host
end
