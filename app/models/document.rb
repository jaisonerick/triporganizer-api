class Document
  attr_accessor :key, :title, :type, :url, :display_type, :uploadable, :trip_id

  def self.get_all(user)
    trips = user.trips.include(:flight_appointments).visible
    registrations = Registration.where(user: user, trip_id: trips.map(&:id)).map { |registration| [registration.trip_id, registration] }.to_h

    documents = []
    documents.push(Document.new(key: :passport,
                                title: 'Passaporte',
                                type: :passport,
                                url: "http://localhost:3000" + user.passport_url,
                                display_type: :image,
                                uploadable: true))

    trips.each do |trip|
      if registrations[trip.id].insurance?
        documents.push(Document.new(key: :insurance,
                                    title: 'Seguro de Viagem',
                                    type: :insurance,
                                    url: "http://localhost:3000" + registrations[trip.id].insurance_url,
                                    display_type: :document,
                                    uploadable: false,
                                    trip_id: trip.id))
      end
    end

    documents
  end

  def initialize(attributes = {})
    attributes.each do |key, value|
      instance_variable_set("@#{key}", value) unless value.nil?
    end
  end
end
