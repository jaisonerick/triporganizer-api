class Document
  attr_accessor :key, :title, :type, :url, :display_type, :uploadable

  def self.get_all(trip, user)
    registration = trip.registrations.find_by(user: user)

    documents = CustomDocument.where(trip: trip).where('registration_id = ? or registration_id is null', registration.id).map do |document|
      Document.new(key: "custom-#{document.id}".to_sym,
                   title: document.name,
                   type: :custom_document,
                   url: document.document_url,
                   display_type: :document,
                   uploadable: false)
    end.presence || []

    documents.push(Document.new(key: :passport,
                                title: 'Passaporte',
                                type: :passport,
                                url: user.passport_url,
                                display_type: :document,
                                uploadable: true))

    if registration.insurance?
      documents.push(Document.new(key: :insurance,
                                  title: 'Seguro de Viagem',
                                  type: :insurance,
                                  url: registration.insurance_url,
                                  display_type: :document,
                                  uploadable: false))
    end

    documents
  end

  def initialize(attributes = {})
    attributes.each do |key, value|
      instance_variable_set("@#{key}", value) unless value.nil?
    end
  end
end
