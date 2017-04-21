class Document
  attr_accessor :key, :title, :type, :url, :display_type, :uploadable

  def self.get_all(trip, user)
    registration = trip.registrations.find_by(user: user)

    documents = []
    documents.push(Document.new(key: :passport,
                                title: 'Passaporte',
                                type: :passport,
                                url: user.passport_url,
                                display_type: :image,
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
