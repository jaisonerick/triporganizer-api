class Sponsor < ApplicationRecord
  mount_uploader :image, DocumentUploader

  belongs_to :trip
end
