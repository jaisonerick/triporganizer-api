class CustomDocument < ApplicationRecord
  mount_uploader :document, PdfDocumentUploader

  belongs_to :trip
  belongs_to :registration

  validates :name, :document, presence: true

  def registration_name
    return ' - ' if registration.blank?
    registration.user.name
  end
end
