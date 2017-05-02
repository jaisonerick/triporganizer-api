class CustomDocument < ApplicationRecord
  mount_uploader :document, PdfDocumentUploader

  belongs_to :trip
  belongs_to :registration
end
