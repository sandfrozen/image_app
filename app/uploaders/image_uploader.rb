class ImageUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  process :convert => 'png'
  process :tags => ['post_picture']
  
  version :medium do
    process :eager => true
    process :resize_to_fill => [300, 300, :north]
  end
  
  version :thumbnail do
    resize_to_fit(100, 100)
  end

  def public_id
    return model.short_name
  end 

end
