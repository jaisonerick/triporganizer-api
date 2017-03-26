class PdfDocumentUploader < CarrierWave::Uploader::Base
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(pdf)
  end

  def filename
    "#{DateTime.current.to_i}_#{original_filename}" if original_filename
  end
end
