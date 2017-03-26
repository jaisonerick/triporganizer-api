class DocumentUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  process :auto_orient

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def auto_orient
    manipulate! do |image|
      image.tap(&:auto_orient)
    end
  end

  def filename
    "#{DateTime.current.to_i}_#{original_filename}" if original_filename
  end
end
