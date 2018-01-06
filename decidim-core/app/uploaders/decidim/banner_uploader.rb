# frozen_string_literal: true

module Decidim
  # This class deals with uploading hero images to ParticipatoryProcesses.
  class BannerUploader < ImageUploader
    include CarrierWave::MiniMagick
    process resize_to_fit: [1700, 300]
  end
end
